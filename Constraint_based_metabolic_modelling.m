%% Constraint-based metabolic modelling
% The example used in this exercise is based on the research article:
% Magnúsdóttir, S., Heinken, A., Kutt, L., et al.(2017). Nature biotechnology, 35(1), 81-89.
%% Initializing CobraToolBox

initCobraToolbox
%% Loading models

bac = readCbModel('models_for_constraint_based_modelling/Bacteroides_caccae_ATCC_43185.xml');
lac = readCbModel('models_for_constraint_based_modelling/Lactobacillus_rhamnosus_GG_ATCC_53103.xml');
%% Uptake reactions
% The media in which the models are simulated are defined by the uptake reactions.
% 
% Setting the reactions to DMEM 6429 medium.

w = warning ('off','all');
DietConstraints = adaptVMHDietToAGORA('models_for_constraint_based_modelling/DMEM', 'AGORA');
bac = useDiet(bac, DietConstraints);
disp('Metabolites taken up by Bacteroides caccae ATCC 43185:')
printUptakeBound(bac);
lac = useDiet(lac, DietConstraints);
disp('Metabolites taken up by Lactobacillus rhamnosus GG:')
printUptakeBound(lac);
%% Simulating Individual models

bac_sol = optimizeCbModel(bac);
disp('The Biomass (per hour) of Bacteroides caccae ATCC 43185 in the given medium')
disp(bac_sol.f)
lac_sol = optimizeCbModel(lac);
disp('The Biomass (per hour) of Lactobacillus rhamnosus GG in the given medium')
disp(bac_sol.f)
%% Creating Community model

comm_model=createMultipleSpeciesModel({bac;lac}, {bac.modelID;lac.modelID});
nameTagsModels = {bac.modelID;lac.modelID};
[comm_model.infoCom,comm_model.indCom]=getMultiSpeciesModelId(comm_model,nameTagsModels);
biomassrxns=strcat({bac.modelID;lac.modelID},[bac.rxns(find(bac.c));lac.rxns(find(lac.c))]); 
biomassid=findRxnIDs(comm_model,biomassrxns);
comm_model.infoCom.spBm=biomassrxns;
comm_model.indCom.spBm=biomassid;

Exrxns_comm=strrep(comm_model.infoCom.EXcom,'[u]','(e)'); %change the nomenclature accordingly
EXRxns1=bac.rxns(findExcRxns(bac));
EXRxns2=lac.rxns(findExcRxns(lac));
for i=1:length(Exrxns_comm)
    if ismember(Exrxns_comm(i),EXRxns1)
        excom_lb(i)=bac.lb(find(contains(bac.rxns,Exrxns_comm(i))));
    elseif ismember(Exrxns_comm(i),EXRxns2)
        excom_lb(i)=lac.lb(find(contains(lac.rxns,Exrxns_comm(i))));
    end
end
comm_model.lb(comm_model.indCom.EXcom)=excom_lb;
comm_model.rxns = strrep(comm_model.rxns,'[u]','(e)')

disp('A community model is created. This community consists of Bacteroides caccae ATCC 43185 and Lactobacillus rhamnosus GG growing together')
%% Simulating the Community

comm_model = useDiet(comm_model, DietConstraints);
disp('Metabolites taken up by the community:')
printUptakeBound(comm_model);
comm_sol = optimizeCbModel(comm_model);
disp('The Biomass (per hour) of the community in the given medium')
disp(comm_sol.f)

% Using SteadyCom (optional)
disp('Running SteadyCom...')
[S,R] = SteadyCom(comm_model);
disp('The Biomass (per hour) of Bacteroides caccae ATCC 43185 grown in the community in the given medium')
disp(R.vBM(1))
disp('The Biomass (per hour) of Lactobacillus rhamnosus GG grown in the community in the given medium')
disp(R.vBM(2))