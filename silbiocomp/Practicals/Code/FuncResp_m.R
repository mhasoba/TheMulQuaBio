#Analyzes data on relationship between consumer-resource body sizes
#consumption rate from functional response data. Needs a *.csv file as
#input.

# library(ggplot2)
library(minpack.lm)
require(graphics)

rm(list = ls())  # clear objects
graphics.off()  #close all open figures and graphics objects

IDir <- "../Data/"
ODir <- "../Results/"
dir.create(paste(ODir,'Figs',sep = ""),showWarnings = FALSE) #Create a directory for figures 

FileName <- "ThermRespData.csv"

Data <- as.data.frame(read.table(paste(IDir, FileName, sep = ""), 
header = TRUE, sep = ",", strip.white = TRUE))

FRData.DataHdrs=fgetl(tmp.fid); %gets headers and deletes them from file
FRData.DataHdrs=strread(FRData.DataHdrs,'%s','delimiter',',')'; %get headers
tmp.textformat = repmat('%s',1,length(FRData.DataHdrs)); %get data
tmp.C = textscan(tmp.fid,tmp.textformat,'delimiter', ',','EmptyValue', -Inf);
fclose(tmp.fid);
tmp.C = [tmp.C{:}]; %yippee! screw xlsread!

#STORE CERTAIN DATA COLUMN NUMBERS FOR REFERENCING
ColN.ID= find(strcmpi('ID',FRData.DataHdrs)==1);
ColN.ConTemp= find(strcmpi('ConTemp',FRData.DataHdrs)==1);
ColN.ResTemp= find(strcmpi('ResTemp',FRData.DataHdrs)==1);
ColN.TrtVal= find(strcmpi('N_TraitValue',FRData.DataHdrs)==1);

ColN.CMass= find(strcmpi('CON_MASS_value',FRData.DataHdrs)==1);
ColN.RMass= find(strcmpi('RES_MASS_value',FRData.DataHdrs)==1);
ColN.Con_Thermy = find(strcmpi('Con_Thermy',FRData.DataHdrs)==1);
ColN.Res_Thermy = find(strcmpi('Res_Thermy',FRData.DataHdrs)==1);
ColN.LabField= find(strcmpi('LabField',FRData.DataHdrs)==1);
ColN.ConTaxaStage = find(strcmpi('ConTaxaStage',FRData.DataHdrs)==1);
ColN.ResTaxaStage = find(strcmpi('ResTaxaStage',FRData.DataHdrs)==1);
ColN.ConTaxa = find(strcmpi('ConTaxa',FRData.DataHdrs)==1);
ColN.ResTaxa = find(strcmpi('ResTaxa',FRData.DataHdrs)==1);
ColN.Habitat= find(strcmpi('Habitat',FRData.DataHdrs)==1);
ColN.ConForagingMovement= find(strcmpi('Con_ForagingMovement',FRData.DataHdrs)==1);
ColN.RESDetectionDimensionality= find(strcmpi('Con_RESDetectionDimensionality',FRData.DataHdrs)==1);
ColN.ResForagingMovement= find(strcmpi('Res_ForagingMovement',FRData.DataHdrs)==1);
ColN.CONDetectionDimensionality= find(strcmpi('Res_CONDetectionDimensionality',FRData.DataHdrs)==1);
ColN.RDen= find(strcmpi('ResDensity_SI_VALUE',FRData.DataHdrs)==1);
ColN.RDenUnit= find(strcmpi('ResArenaSize_SI_UNIT',FRData.DataHdrs)==1);
ColN.Citation = find(strcmpi('Citation',FRData.DataHdrs)==1);

FRData.Data = tmp.C; %all data
FRData.NumData = str2double(FRData.Data);#get numeric data; will be slow

#for i = 1:size(tmp.C,1) # replace NaN's with nodata (nans can be problematic)
#    for j = 1:size(tmp.C,2)
#        if isnan(tmp.C{i,j})
#            tmp.C{i,j} = ''; %replace nans with nodata
#        elseif isnumeric(tmp.C{i,j})
#            tmp.C{i,j} = num2str(tmp.C{i,j}); %Convert to string for format consistency
#        end
#    end
#end

%MAKE KEY TO MAP BETWEEN PROTOCOL IDS AND TRAIT NAMES
FRData.IDs = unique(FRData.NumData(:,ColN.ID));
FRData.sers = length(FRData.IDs);
FRData.TrtKey = cell(FRData.sers,size(FRData.Data,2));
for i = 1:FRData.sers
    for j = 1:size(FRData.NumData,1)
        if FRData.NumData(j,ColN.ID) == FRData.IDs(i)
            FRData.TrtKey(i,:) = FRData.Data(j,:);
            break
        end
    end
end

#FIT FUNCTIONS
params.pValCut = .05; params.RSqValCut = .5;
#%To TEMPERATURE CORRECT consrate estimates
#tmp.temps = zeros(FRData.sers,1); #get all temperatures to find appropriate tref
#for i = 1: FRData.sers
#    tmp.temps(i) = str2double(FRData.TrtKey{i,ColN.ConTemp});
#end
#params.Tref = mean(tmp.temps); %appropriate tref is the most common one
params.Tref = 20; %fixed tref
params.k = 8.617*10^-5; %boltzmann's constant
params.E = 0.0;
tmp.whichstats = {'beta','yhat','r','mse','rsquare','adjrsquare','standres','tstat','fstat'}; %defining the required statistics tp be obtained from the regression analyses below
tmp.options = statset('Display','iter','FunValCheck','on','MaxIter',2000,'TolFun',1e-30,'TolX',1e-30);
tmp.t_h_Strt = linspace(0,100,100);
tmp.q_strt = 0;
i = 0; %initialize counter
params.fntsiz = 14; params.mrksiz = 12; params.scrsz = get( 0, 'ScreenSize' );
while i < FRData.sers
    i = i+1;
    tmp.inds = find(FRData.NumData(:,ColN.ID) == FRData.IDs(i));
    tmp.NumDat = FRData.NumData(tmp.inds,:);%extract current data series
    tmp.Dat = (FRData.Data(tmp.inds,:));
    tmp.NumDat = [tmp.NumDat(:,ColN.RDen) tmp.NumDat(:,ColN.TrtVal)]; %isolate only relevant numerical data
    tmp.NumDat(:,2) = tmp.NumDat(:,2)*exp(-(params.E/params.k)*((1/(params.Tref+273.15))-(1/(str2double(tmp.Dat(1,ColN.ConTemp))+273.15)))); %temperature correction
    if std(tmp.NumDat(:,1)) == 0 %error checks
        error(strcat('Series ', tmp.Dat(1,ColN.ID), ' has no variation in resource density!'))
    elseif length(unique([tmp.Dat(:,ColN.ConTaxaStage);tmp.Dat(:,ColN.ResTaxaStage)])) ~= 2
        error(['Series ', tmp.Dat(1,ColN.ID), ' has less or more than two taxa!'])
    end
    if length(unique(tmp.NumDat(:,1)))< length(tmp.NumDat(:,1)) %take averages at densities if possible
        tmp.tmp.NumDat = zeros(length(unique(tmp.NumDat(:,1))),2);
        tmp.tmp.NumDat(:,1) = unique(tmp.NumDat(:,1));
        for j = 1:size(tmp.tmp.NumDat,1)
            tmp.tmp.inds = find(tmp.NumDat(:,1) == tmp.tmp.NumDat(j,1));
            tmp.tmp.tmpnumdat = tmp.NumDat(tmp.tmp.inds,:);
            tmp.tmp.NumDat(j,2) = mean(tmp.tmp.tmpnumdat(:,2));
        end
        tmp.NumDat = tmp.tmp.NumDat;
    end
    tmp.MaxDen = max(tmp.NumDat(:,1));
    tmp.MinDen = min(tmp.NumDat(:,1));
    tmp.b_Strt = tmp.NumDat(find(tmp.NumDat(:,1) == tmp.MinDen),2)/tmp.MinDen;

    tmp.RegStats.ci = inf;
   ct = 0;%counter for t_h_strt values
   while ct < length(tmp.t_h_Strt)
       ct = ct+1;
       try
           [tmp.RegStats.beta,tmp.RegStats.r,tmp.RegStats.J,tmp.RegStats.sigma,tmp.RegStats.mse] =...
               nlinfit(tmp.NumDat(:,1),tmp.NumDat(:,2),@FuncResp,[tmp.b_Strt;tmp.t_h_Strt(ct);tmp.q_strt],tmp.options);#fit the generalized functional response
           tmp.RegStats.rsquare = 1 - sum(tmp.RegStats.r.^2) / sum((tmp.NumDat(:,2) - mean(tmp.NumDat(:,2))).^2);
           tmp.RegStats.ci = nlparci(tmp.RegStats.beta,tmp.RegStats.r,'covar',tmp.RegStats.sigma);
       catch
           tmp.RegStats.ci = inf;
       end
       if ~isinf(tmp.RegStats.ci(1,1))
           break
       end
   end
            
    tmp.RegStatsP = regstats(tmp.NumDat(:,2),tmp.NumDat(:,1),'purequadratic',tmp.whichstats); %fit quadratic
    tmp.p = flipud(tmp.RegStatsP.beta);
    
    tmp.FRMinDen = mean(tmp.NumDat(find(tmp.NumDat(:,1)==tmp.MinDen),2));%get mean CR observed at min density
    tmp.HalfMax = max(tmp.NumDat(:,2))/2; #get half of max rate
    tmp.LBnd = max(tmp.NumDat(find(tmp.NumDat(:,2)<tmp.HalfMax),2)); %get closest lower consrate to half max
    if ~isempty(tmp.LBnd)#only if consumption was actually measured at lower than half-max rate
        tmp.UBnd = min(tmp.NumDat(find(tmp.NumDat(:,2)>tmp.HalfMax),2)); %get closest upper consrate to half max
        tmp.LBndDen = max(tmp.NumDat(find(tmp.NumDat(:,2)<tmp.HalfMax),1)); %get density value at lower bound
        tmp.UBndDen = min(tmp.NumDat(find(tmp.NumDat(:,2)>tmp.HalfMax),1)); %get density value at upper bound
        tmp.LWt = 1-(tmp.HalfMax-tmp.LBnd)/(tmp.UBnd-tmp.LBnd); %Calculate weights
        tmp.UWt = 1-(tmp.UBnd-tmp.HalfMax)/(tmp.UBnd-tmp.LBnd);
        tmp.DenHalfMax = (tmp.LBndDen*tmp.LWt)+(tmp.UBndDen*tmp.UWt); #get density for half max rate
    else
        tmp.DenHalfMax = min(tmp.NumDat(:,1));
    end
    
    k = 1; %column counter
    results.All{i,k} = FRData.IDs(i); k = k+1;%C
    results.All{i,k} = tmp.Dat{1,ColN.Habitat}; k = k+1;%Habitat
    results.All{i,k} = tmp.Dat{1,ColN.Con_Thermy}; k = k+1;%Consumer thermy
    results.All{i,k} = tmp.Dat{1,ColN.Res_Thermy}; k = k+1;%Resource thermy
    results.All{i,k} = tmp.Dat{1,ColN.ConForagingMovement}; k = k+1;#ConForagingMovement
    results.All{i,k} = tmp.Dat{1,ColN.RESDetectionDimensionality}; k = k+1;%RESDetectionDimensionality
    results.All{i,k} = tmp.Dat{1,ColN.ResForagingMovement}; k = k+1;%ResForagingMovement
    results.All{i,k} = tmp.Dat{1,ColN.CONDetectionDimensionality}; k = k+1;%CONDetectionDimensionality
    results.All{i,k} = tmp.Dat{1,ColN.RDenUnit}; k = k+1;%Arena dimensions
    results.All{i,k} = tmp.Dat{1,ColN.ConTaxa}; k = k+1;%Consumer name
    results.All{i,k} = tmp.Dat{1,ColN.ResTaxa}; k = k+1;%Resource name
    results.All{i,k} = tmp.Dat{1,ColN.ConTaxaStage}; k = k+1;%Consumer name with stage
    results.All{i,k} = tmp.Dat{1,ColN.ResTaxaStage}; k = k+1;%Resource name  with stage
    results.All{i,k} = tmp.Dat{1,ColN.CMass}; k = k+1;%Consumer mass
    results.All{i,k} = log10(str2double(results.All{i,k-1})); k = k+1; #log10 Consumer mass
    results.All{i,k} = tmp.Dat{1,ColN.RMass}; k = k+1;%Resource mass
    results.All{i,k} = log10(str2double(results.All(i,k-1))); k = k+1; #log10 Resource mass
    results.All{i,k} = str2double(tmp.Dat(1,ColN.RMass))/str2double(tmp.Dat(1,ColN.CMass)); k = k+1; #CRBR
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 CRBR
    results.All{i,k} = tmp.NumDat(find(tmp.NumDat(:,1) == tmp.MinDen),2)/tmp.MinDen; k = k+1; #"Search rate"
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 "Search rate"
    results.All{i,k} = tmp.NumDat(find(tmp.NumDat(:,1) == tmp.MinDen),2); k = k+1; #consumption rate at minimum res density
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 min consumption rate
    results.All{i,k} = tmp.MinDen;k = k+1; #Minimum resource density
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 minimum resource density
    results.All{i,k} = max(tmp.NumDat(:,2)); k = k+1; #Maximum (asymptotic) consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 max (asymptotic) consumption rate
    results.All{i,k} = tmp.NumDat(find(tmp.NumDat(:,2) == max(tmp.NumDat(:,2)),1)); k = k+1; #Resource density at max consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 density at max consumption rate
    results.All{i,k} = tmp.HalfMax; k = k+1; #half-max consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 half-max consumption rate
    results.All{i,k} = tmp.DenHalfMax; k = k+1; #Resource density at half-max consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 resource density at half-max consumption rate
    results.All{i,k} = tmp.NumDat(find(tmp.NumDat(:,1) == tmp.MinDen),2)*str2double(tmp.Dat{1,ColN.RMass}); k = k+1; #biomass consumption rate at minimum res density
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 min biomass consumption rate
    results.All{i,k} = tmp.MinDen*str2double(tmp.Dat{1,ColN.RMass});k = k+1; #Minimum resource biomass density
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 minimum resource biomass density
    results.All{i,k} = max(tmp.NumDat(:,2))*str2double(tmp.Dat{1,ColN.RMass}); k = k+1; #Maximum (asymptotic) biomass consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 max (asymptotic) biomass consumption rate
    results.All{i,k} = tmp.NumDat(find(tmp.NumDat(:,2) == max(tmp.NumDat(:,2)),1))*str2double(tmp.Dat{1,ColN.RMass}); k = k+1; #Resource biomass density at max consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 density at max biomass consumption rate
    results.All{i,k} = tmp.HalfMax*str2double(tmp.Dat{1,ColN.RMass}); k = k+1; # half-max biomass consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 half-max biomass consumption rate
    results.All{i,k} = tmp.DenHalfMax*str2double(tmp.Dat{1,ColN.RMass}); k = k+1; #Resource biomass density at half-max biomass consumption rate
    results.All{i,k} = log10(results.All{i,k-1}); k = k+1; #log10 resource density at half-max biomass consumption rate
    if tmp.p(1) < 0 %The second derivative test is passed, i.e., FR is concave downwards or asymptotic
        if -tmp.p(2)/(2*tmp.p(1)) < tmp.MaxDen && -tmp.p(2)/(2*tmp.p(1)) > tmp.MinDen %if function max lies within res density data range
            results.All{i,k} = 'Type II/III';k = k+1; #Identify type of FR
        elseif -tmp.p(2)/(2*tmp.p(1)) >= tmp.MaxDen#function max lies above res density data range
            results.All{i,k} = 'Type I';k = k+1; #Identify type of FR
        elseif -tmp.p(2)/(2*tmp.p(1)) <= tmp.MinDen %function max lies below res density data range
            results.All{i,k} = 'declining';k = k+1; #Identify type of FR
        end
    else %The FR is convex (concave upwards)
        if (-tmp.p(2)/(2*tmp.p(1)) < tmp.MaxDen && -tmp.p(2)/(2*tmp.p(1)) > tmp.MinDen) ||... %if function max lies within res density data range
                -tmp.p(2)/(2*tmp.p(1)) <= tmp.MinDen #or function min lies below res density data range
            results.All{i,k} = 'concave-upwards';k = k+1;  #Identify type of FR
        elseif -tmp.p(2)/(2*tmp.p(1)) >= tmp.MaxDen#function min lies above res density data range
            results.All{i,k} = 'declining';k = k+1; #Identify type of FR
        end
    end

    if ~isinf(tmp.RegStats.ci(1,1));
        results.All{i,k} = tmp.RegStats.rsquare;k = k+1; %R-square of fitted FR model
        results.All{i,k} = tmp.RegStats.beta(1);k = k+1; %search rate from fitted FR model
        results.All{i,k} = tmp.RegStats.beta(1) - min(tmp.RegStats.ci(1,:));k = k+1; #95#CI
        results.All{i,k} = tmp.RegStats.beta(2);k = k+1; %handling time from fitted FR model
        results.All{i,k} = tmp.RegStats.beta(2) - min(tmp.RegStats.ci(2,:));k = k+1; #95#CI
        results.All{i,k} = tmp.RegStats.beta(3);k = k+1; #Exponent q from fitted FR model
        results.All{i,k} = tmp.RegStats.beta(3) - min(tmp.RegStats.ci(3,:));k = k+1; #95#CI
        if tmp.RegStats.beta(2) <= 0 %Check FR type
            results.All{i,k} = 'Type I';k = k+1; #Identify type of FR
            results.All{i,k} = 'NA';k = k+1; #Identify if the q estimate is significantly different from zero
        elseif tmp.RegStats.beta(2) > 0 && tmp.RegStats.beta(3)<=0
            results.All{i,k} = 'Type II';k = k+1; #Identify type of FR
            results.All{i,k} = 'NA';k = k+1; #Identify if the q estimate is significantly different from zero
        elseif tmp.RegStats.beta(2) > 0 && tmp.RegStats.beta(3) > 0 %
            results.All{i,k} = 'Type III';k = k+1; #Identify type of FR
            if min(tmp.RegStats.ci(3,:)) <= 0 || tmp.RegStats.rsquare < 0.5
                results.All{i,k} = 'NS';k = k+1; #Identify if the q estimate is significantly different from zero
            else
                results.All{i,k} = 'S';k = k+1;
            end
        else
        end
    else
        k = k+9;
    end
    results.All{i,k} = tmp.Dat{1,ColN.Citation}; #Data reference 
    
    #+++++++++++++++For plotting++++++++++++++++
    
#    tmp.x = linspace(tmp.MinDen,tmp.MaxDen,100);
#    tmp.SupTitle = {[tmp.Dat{1,ColN.ID} '-' tmp.Dat{1,ColN.ConTaxaStage} ' -> ']; tmp.Dat{1,ColN.ResTaxaStage}};
#    #        figure('Position',params.scrsz,'visible','on');
#    figure('visible','off'); box on
#    set(gcf,'Color',[1,1,1]); hold on
#    #    tmp.h_stit = suptitle(SupTitle);
#    #    set(h_stit,'fontsize',params.fntsiz*.85,'fontweight','bold')
#    plot(tmp.NumDat(:,1),tmp.NumDat(:,2),'o','markersize',params.mrksiz*0.75); hold on
#    if ~isinf(tmp.RegStats.ci);
#        plot(tmp.x,tmp.RegStats.beta(1)*tmp.x.^(tmp.RegStats.beta(3)+1)./...
#            (1+(tmp.RegStats.beta(1)*tmp.RegStats.beta(2)*tmp.x.^(tmp.RegStats.beta(3)+1))))
#    end
#    #    h = plot(tmp.x,polyval(tmp.p,tmp.x,'-', tmp.NumDat(:,1),tmp.NumDat(:,2),'.k','markersize',params.mrksiz); hold on
#    plot(tmp.DenHalfMax,tmp.HalfMax,'b*','markersize',params.mrksiz);
#    title(tmp.SupTitle,'fontsize',params.fntsiz*.85,'fontweight','bold')
#    xlabel('Resource density','fontsize',params.fntsiz,'fontweight','bold');
#    ylabel('Consumption rate','fontsize',params.fntsiz,'fontweight','bold')
#    set(gca,'fontsize',params.fntsiz,'fontweight','bold');
#    set(gcf, 'PaperPositionMode', 'auto');#set to print as seen on screen
#    print ('-depsc',['/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/FRFigs/' tmp.Dat{1,ColN.ID} '.eps'])
#    close all
end
results.Hdrs = [];
k = 1; %header column counter
results.Hdrs{1,k} = 'ID'; k = k+1;
results.Hdrs{1,k} = 'Habitat'; k = k+1;%Habitat
results.Hdrs{1,k} = 'CTherm'; k = k+1;%Consumer thermy
results.Hdrs{1,k} = 'RTherm'; k = k+1;%Resource thermy
results.Hdrs{1,k} = 'CForMov'; k = k+1;#ConForagingMovement
results.Hdrs{1,k} = 'RDetD'; k = k+1;%RESDetectionDimensionality
results.Hdrs{1,k} = 'RForMov'; k = k+1;%ResForagingMovement
results.Hdrs{1,k} = 'CDetD'; k = k+1;%CONDetectionDimensionality
results.Hdrs{1,k} = 'ArenaD'; k = k+1;%Arena dimensions
results.Hdrs{1,k} = 'CName'; k = k+1;%Consumer name
results.Hdrs{1,k} = 'RName'; k = k+1;%Resource name
results.Hdrs{1,k} = 'CNameStage'; k = k+1;%Consumer name with stage
results.Hdrs{1,k} = 'RNameStage'; k = k+1;%Resource name with stage
results.Hdrs{1,k} = 'CMass'; k = k+1;%Consumer mass
results.Hdrs{1,k} = 'log10CMass'; k = k+1; #log10 Consumer mass
results.Hdrs{1,k} = 'RMass'; k = k+1;%Resource mass
results.Hdrs{1,k} = 'log10RMass'; k = k+1; #log10 Resource mass
results.Hdrs{1,k} = 'CRBR'; k = k+1; #CRBR
results.Hdrs{1,k} = 'log10CRBR'; k = k+1; #log10 CRBR
results.Hdrs{1,k} = 'SearchRate'; k = k+1; #"Search rate"
results.Hdrs{1,k} = 'Log10SearchRate'; k = k+1; #log10 "Search rate"
results.Hdrs{1,k} = 'MnConsRate'; k = k+1; #consumption rate at minimum res density
results.Hdrs{1,k} = 'Log10MnConsRate'; k = k+1; #log10 min consumption rate
results.Hdrs{1,k} = 'RDenMnConsRate';k = k+1; #Minimum resource density
results.Hdrs{1,k} = 'Log10RDenMnConsRate'; k = k+1; #log10 minimum resource density
results.Hdrs{1,k} = 'MxConsRate'; k = k+1; #Maximum (asymptotic) consumption rate
results.Hdrs{1,k} = 'Log10MxConsRate'; k = k+1; #log10 max (asymptotic) consumption rate
results.Hdrs{1,k} = 'RDenMxConsRate'; k = k+1; #Resource density at max consumption rate
results.Hdrs{1,k} = 'Log10RDenMxConsRate'; k = k+1; #log10 density at max consumption rate
results.Hdrs{1,k} = 'HalfMxConsRate'; k = k+1; #half-max consumption rate
results.Hdrs{1,k} = 'Log10HalfMxConsRate'; k = k+1; #log10 half-max consumption rate
results.Hdrs{1,k} = 'RDenHalfMxConsRate'; k = k+1; #Resource density at half-max consumption rate
results.Hdrs{1,k} = 'Log10RDenHalfMxConsRate'; k = k+1; #log10 resource density at half-max consumption rate
results.Hdrs{1,k} = 'MnMassConsRate'; k = k+1; #biomass consumption rate at minimum res density
results.Hdrs{1,k} = 'Log10MnMassConsRate'; k = k+1; #log10 min biomass consumption rate
results.Hdrs{1,k} = 'RDenMnMassConsRate'; k = k+1;  #Minimum resource biomass density
results.Hdrs{1,k} = 'Log10RDenMnMassConsRate'; k = k+1; #log10 minimum resource biomass density
results.Hdrs{1,k} = 'MxMassConsRate'; k = k+1; #Maximum (asymptotic) biomass consumption rate
results.Hdrs{1,k} = 'Log10MxMassConsRate'; k = k+1; #log10 max (asymptotic) biomass consumption rate
results.Hdrs{1,k} = 'RDenMxMassConsRate'; k = k+1; #Resource biomass density at max consumption rate
results.Hdrs{1,k} = 'Log10RDenMxMassConsRate'; k = k+1; #log10 biomass density at max biomass consumption rate
results.Hdrs{1,k} = 'HalfMxMassConsRate'; k = k+1; #half-max biomass consumption rate
results.Hdrs{1,k} = 'Log10HalfMxMassConsRate'; k = k+1; #log10 half-max biomass consumption rate
results.Hdrs{1,k} = 'RDenHalfMxMassConsRate'; k = k+1; #Resource density at half-max biomass consumption rate
results.Hdrs{1,k} = 'Log10RDenHalfMxMassConsRate'; k = k+1; #log10 resource density at half-max biomass consumption rate
results.Hdrs{1,k} = 'FRType'; k = k+1;#Identify type of FR from quadratic fit
results.Hdrs{1,k} = 'RSqFRFit';k = k+1; %R-square of fitted FR model
results.Hdrs{1,k} = 'SearchRateFRFit';k = k+1; %Search rate from fitted FR model
results.Hdrs{1,k} = '95%CISearchRateFRFit';k = k+1; #95#CI
results.Hdrs{1,k} = 'HTim';k = k+1; %handling time from fitted FR model
results.Hdrs{1,k} = '95%CIHTim';k = k+1; #95#CI
results.Hdrs{1,k} = 'q';k = k+1; #Exponent q from fitted FR model
results.Hdrs{1,k} = '95%CIq';k = k+1; #95#CI
results.Hdrs{1,k} = 'FRTypeFRFit'; k = k+1;#Identify type of FR from FR model fit
results.Hdrs{1,k} = 'SigFRFit';k = k+1; #If the q estimate is significantly different from zero
results.Hdrs{1,k} = 'Citation'; #Identify type of FR
tmp.out = [results.Hdrs;results.All];
cell2csv('/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/FR_Results_All.csv', tmp.out);
#csvwrit([Results.Cerrado.Robust.Rdm.Po.RemSeq Results.Cerrado.Robust.Rdm.Po.ExtSeq],...
#    strcat(cd,'/Results.Cerrado.Robust.Rdm.Po.csv'),'Removal,Extinction,SD')

#Alternative method to save to csv (only works if all cell enteries ate text - use num2str if needed):
#tmp.fid = fopen('/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/FR_Results_All.csv','wt');
#tmp.textformat = repmat('%s',size(results.Hdrs)); %create output format string
#[rows,cols]=size(tmp.out);
#for i=1:rows
#    fprintf(tmp.fid,'%s,',tmp.out{i,1:end-1});
#    fprintf(tmp.fid,'%s\n',tmp.out{i,end});
#end
#fclose(tmp.fid);

%++++++++++++++++FURTHER ANALYSES+++++++++++
ColN.CName= find(strcmpi('CName',results.Hdrs)==1);
ColN.RName= find(strcmpi('RName',results.Hdrs)==1);
ColN.CNameStage= find(strcmpi('CNameStage',results.Hdrs)==1);
ColN.RNameStage= find(strcmpi('RNameStage',results.Hdrs)==1);
ColN.CMass= find(strcmpi('CMass',results.Hdrs)==1);
ColN.RMass= find(strcmpi('RMass',results.Hdrs)==1);
ColN.MxConsRate= find(strcmpi('MxMassConsRate',results.Hdrs)==1);
ColN.ID= find(strcmpi('ID',results.Hdrs)==1);
ColN.Habitat= find(strcmpi('Habitat',results.Hdrs)==1);
ColN.CForMov= find(strcmpi('CForMov',results.Hdrs)==1);
ColN.RDetD= find(strcmpi('RDetD',results.Hdrs)==1);
ColN.RForMov= find(strcmpi('RForMov',results.Hdrs)==1);
ColN.CRBR= find(strcmpi('log10CRBR',results.Hdrs)==1);

results.CTaxa = unique(results.All(:,ColN.CNameStage)); %Get list of consumers
results.RTaxa = unique(results.All(:,ColN.RNameStage)); %Get list of resources
results.Taxa = unique([results.All(:,ColN.CNameStage);results.All(:,ColN.RNameStage)]); %Get oveall taxa list

%+++++++++++++NOW GET RESULTS WITH ONLY OPTIMAL CRBR'S+++++++++++
tmp.CRNamesVec= cell(size(results.All,1),1); %cell array to hold CR pair names
for i = 1 : size(results.All,1)%create names
    tmp.CRNamesVec(i) = cellstr([results.All{i,ColN.CNameStage} results.All{i,ColN.CMass} results.All{i,ColN.RNameStage}]);
end
tmp.CRNames = unique(tmp.CRNamesVec); %get unique names
results.AllOptCRBR = cell(length(tmp.CRNames),size(results.All,2));
for i = 1:length(tmp.CRNames)
    tmp.dat = results.All(find(strcmpi(tmp.CRNamesVec,tmp.CRNames(i))==1),:);
    tmp.inds = find(cell2mat(tmp.dat(:,ColN.MxConsRate))==max(cell2mat(tmp.dat(:,ColN.MxConsRate))));
    results.AllOptCRBR(i,:) = tmp.dat(tmp.inds,:);
end
tmp.out = [results.Hdrs;results.AllOptCRBR];
cell2csv('/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/FRAllOptCRBR_Results.csv', tmp.out);

%+++++++++++++NOW GET INTRASPECIFIC RESULTS+++++++++++
%Consumer size fixed, resource size variable
tmp.CRNamesVec= cell(size(results.All,1),1); %cell array to hold CR pair names
for i = 1 : size(results.All,1)%create names
    tmp.CRNamesVec(i) = cellstr([results.All{i,ColN.CName} results.All{i,ColN.CMass} results.All{i,ColN.RName}]);
end
tmp.CRNames = unique(tmp.CRNamesVec); %get unique names
results.IntraFRCR = [];%this will hold all intraspecific FR's where consumer mass is fixed and resource variable
for i = 1:length(tmp.CRNames)
    tmp.dat = results.All(find(strcmpi(tmp.CRNamesVec,tmp.CRNames(i))==1),:);
    if size(tmp.dat,1) > 2 %only if atleast  3 CRBR ratios were covered
        results.IntraFRCR = [results.IntraFRCR;tmp.dat];
    end
end
tmp.out = [results.Hdrs;results.IntraFRCR];
cell2csv('/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/IntraFR_Result_CFixRVar.csv', tmp.out);

%Resource size fixed, consumer size variable
tmp.CRNamesVec= cell(size(results.All,1),1); %cell array to hold CR pair names
for i = 1 : size(results.All,1)%create names
    tmp.CRNamesVec(i) = cellstr([results.All{i,ColN.RName} results.All{i,ColN.RMass} results.All{i,ColN.CName}]);
end
tmp.CRNames = unique(tmp.CRNamesVec); %get unique names
results.IntraFRRC = [];%this will hold all intraspecific FR's where consumer mass is fixed and resource variable
for i = 1:length(tmp.CRNames)
    tmp.dat = results.All(find(strcmpi(tmp.CRNamesVec,tmp.CRNames(i))==1),:);
    if size(tmp.dat,1) > 2 %only if atleast  3 CRBR ratios were covered
        results.IntraFRRC = [results.IntraFRRC;tmp.dat];
    end
end
tmp.out = [results.Hdrs;results.IntraFRRC];
cell2csv('/home/mhasoba/Documents/pubisorpenis/PHEW!/Size-consumption/results/IntraFR_Result_CVarRFix.csv', tmp.out);

#%+++++++++++++++DIVVY UP RESULTS BY HABITAT x FORAGING STRATEGY++++++++++++++++++
%
#%For only optimal CRBR results
%
#params.CRBRThresh = -4; %threshold log10CRBR value below which thee interaction is to be considered filter feeding
#tmp.dat = results.AllOptCRBR; %create temp data to modify some names
#for i = 1: size(tmp.dat,1)
#    if strcmpi(tmp.dat{i,ColN.CForMov},'active')==1
#        tmp.dat{i,ColN.CForMov} = 'A';
#    elseif strcmpi(tmp.dat{i,ColN.CForMov},'passive')==1
#        tmp.dat{i,ColN.CForMov} = 'A';
#    elseif strcmpi(tmp.dat{i,ColN.CForMov},'sessile')==1
#        tmp.dat{i,ColN.CForMov} = 'S';
#    end
#    if strcmpi(tmp.dat{i,ColN.RForMov},'active')==1
#        tmp.dat{i,ColN.RForMov} = 'A';
#    elseif strcmpi(tmp.dat{i,ColN.RForMov},'passive')==1
#        tmp.dat{i,ColN.RForMov} = 'A';
#    elseif strcmpi(tmp.dat{i,ColN.RForMov},'sessile')==1
#        tmp.dat{i,ColN.RForMov} = 'S';
#    end
#    if strcmpi(tmp.dat{i,ColN.RDetD},'half-sphere')==1
#        tmp.dat{i,ColN.RDetD} = '3D';
#    elseif strcmpi(tmp.dat{i,ColN.RDetD},'sphere')==1
#        tmp.dat{i,ColN.RDetD} = '3D';
#    elseif strcmpi(tmp.dat{i,ColN.RDetD},'surface')==1
#        tmp.dat{i,ColN.RDetD} = '2D';
#    end
#end
#tmp.ForStr = cell(size(tmp.dat,1),1); %cell array to hold foraging strategy names
#for i = 1 : size(results.AllOptCRBR,1)%create strategy names
#    tmp.ForStr(i) = cellstr([tmp.dat{i,ColN.RDetD} tmp.dat{i,ColN.CForMov} tmp.dat{i,ColN.RForMov}]);
#end
#tmp.habitats = unique(results.AllOptCRBR(:,ColN.Habitat)); %get habitat names
#tmp.ForStrats = unique(tmp.ForStr); %get strategy names
%
#for i = 1:length(tmp.habitats) #divvy up the results
#    results.(tmp.habitats{i})= results.AllOptCRBR(find(strcmpi(results.AllOptCRBR(:,ColN.Habitat),tmp.habitats{i,1})==1),:); %extract results for habitat
#    tmp.(tmp.habitats{i})= tmp.dat(find(strcmpi(tmp.dat(:,ColN.Habitat),tmp.habitats{i,1})==1),:);  %extract strategy-renamed results for habitat
#    tmp.tmpForStr = tmp.ForStr(find(strcmpi(tmp.dat(:,ColN.Habitat),tmp.habitats{i,1})==1));  %extract foraging strategies vector for habitat
#    for j = 1:length(tmp.ForStrats)
#        tmp.results = results.(tmp.habitats{i})(find(strcmpi(tmp.tmpForStr(:,1),tmp.ForStrats{j,1})==1),:); %extract results for habitat
#        if any(cell2mat(tmp.results(:,ColN.CRBR))<=params.CRBRThresh)
#            results.([tmp.habitats{i} tmp.ForStrats{j} 'Flt'])= tmp.results(find(cell2mat(tmp.results(:,ColN.CRBR))<=params.CRBRThresh),:);
#            tmp.results(find(cell2mat(tmp.results(:,ColN.CRBR))<=params.CRBRThresh),:) = [];
#            xlswrite(['D:\pubisorpenis\PHEW!\Size-consumption\results\' 'FRAllOptCRBR' '_Results.xlsx'],...
#                cell(1000,1000),([tmp.habitats{i} tmp.ForStrats{j} 'Flt']))%clear existing sheet
#            xlswrite(['D:\pubisorpenis\PHEW!\Size-consumption\results\' 'FRAllOptCRBR' '_Results.xlsx'],...
#                [results.Hdrs;results.([tmp.habitats{i} tmp.ForStrats{j} 'Flt'])],([tmp.habitats{i} tmp.ForStrats{j} 'Flt']))%output results
#        end
#        results.([tmp.habitats{i} tmp.ForStrats{j}])=  tmp.results;
#        if size(results.([tmp.habitats{i} tmp.ForStrats{j}]),1)>0
#            xlswrite(['D:\pubisorpenis\PHEW!\Size-consumption\results\' 'FRAllOptCRBR' '_Results.xlsx'],...
#                cell(1000,1000),([tmp.habitats{i} tmp.ForStrats{j}]))%output results
#            xlswrite(['D:\pubisorpenis\PHEW!\Size-consumption\results\' 'FRAllOptCRBR' '_Results.xlsx'],...
#                [results.Hdrs;results.([tmp.habitats{i} tmp.ForStrats{j}])],([tmp.habitats{i} tmp.ForStrats{j}]))%output results
#        end
#    end
#end
clear tmp i j k
