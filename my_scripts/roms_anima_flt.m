grd='C:\cygwin64\home\Takashi\ROMS\Projects\Shiraho_reef_offline\Data\shiraho_reef_grid11.nc';
his='C:\cygwin64\home\Takashi\ROMS\Projects\Shiraho_reef_offline\ocean_his.nc';
flt='C:\cygwin64\home\Takashi\ROMS\Projects\Shiraho_reef_offline\ocean_flt.nc';
%grd='D:\output\ROMS\Shiraho_reef\flt_test1\Data\shiraho_reef_grid10.nc';
%his='D:\output\ROMS\Shiraho_reef\flt_test1\ocean_his.nc';
%flt='D:\output\ROMS\Shiraho_reef\flt_test1\ocean_flt.nc';
%grd='D:\output\ROMS\Shiraho_reef\flt_test2\Data\shiraho_reef_grid10.nc';
%his='D:\output\ROMS\Shiraho_reef\flt_test2\ocean_his.nc';
%flt='D:\output\ROMS\Shiraho_reef\flt_test2\ocean_flt.nc';

Jm=192;   % Mm+2
Im=64;    % Lm+2

h          = nc_varget(grd,'h');
p_coral    = nc_varget(grd,'p_coral');
%p_seagrass = nc_varget(grd,'p_seagrass');
%lat_rho    = nc_varget(grd,'lat_rho');
%lon_rho    = nc_varget(grd,'lon_rho');
x_rho      = nc_varget(grd,'x_rho');
y_rho      = nc_varget(grd,'y_rho');
c(1:Jm,1:Im)=0;
x_rho=x_rho/1000; % m->km
y_rho=y_rho/1000; % m->km

k=0;
i=1;

id = 16;


close all

%time = nc_varget(his,'ocean_time',[i],[1]);
time = nc_varget(flt,'ocean_time');
imax=length(time);

%---------------------------------------------------------------------
%  Read in floats data. 
%---------------------------------------------------------------------

spherical=nc_read(his,'spherical');

if (spherical),
  xfloat=nc_read(flt,'lon');
  yfloat=nc_read(flt,'lat');
  dfloat=nc_read(flt,'depth');
else  
  xfloat=nc_read(flt,'x').*0.001;
  yfloat=nc_read(flt,'y').*0.001;
  dfloat=nc_read(flt,'depth').*-1;
end  


% My color map
colmap1=[1 1 1;0.961538434028625 0.961538434028625 1;0.923076927661896 0.923076927661896 1;0.884615361690521 0.884615361690521 1;0.846153855323792 0.846153855323792 1;0.807692289352417 0.807692289352417 1;0.769230782985687 0.769230782985687 1;0.730769217014313 0.730769217014313 1;0.692307710647583 0.692307710647583 1;0.653846144676209 0.653846144676209 1;0.615384638309479 0.615384638309479 1;0.576923072338104 0.576923072338104 1;0.538461565971375 0.538461565971375 1;0.5 0.5 1;0.461538463830948 0.461538463830948 1;0.423076927661896 0.423076927661896 1;0.384615391492844 0.384615391492844 1;0.346153855323792 0.346153855323792 1;0.307692319154739 0.307692319154739 1;0.269230782985687 0.269230782985687 1;0.230769231915474 0.230769231915474 1;0.192307695746422 0.192307695746422 1;0.15384615957737 0.15384615957737 1;0.115384615957737 0.115384615957737 1;0.0769230797886848 0.0769230797886848 1;0.0384615398943424 0.0384615398943424 1;0 0 1;0 0.014492753893137 1;0 0.028985507786274 1;0 0.0434782616794109 1;0 0.0579710155725479 1;0 0.0724637657403946 1;0 0.0869565233588219 1;0 0.101449273526669 1;0 0.115942031145096 1;0 0.130434781312943 1;0 0.144927531480789 1;0 0.159420296549797 1;0 0.173913046717644 1;0 0.18840579688549 1;0 0.202898547053337 1;0 0.217391297221184 1;0 0.231884062290192 1;0 0.246376812458038 1;0 0.260869562625885 1;0 0.275362312793732 1;0 0.289855062961578 1;0 0.304347813129425 1;0 0.318840593099594 1;0 0.333333343267441 1;0 0.347826093435287 1;0 0.362318843603134 1;0 0.376811593770981 1;0 0.391304343938828 1;0 0.405797094106674 1;0 0.420289844274521 1;0 0.434782594442368 1;0 0.449275374412537 1;0 0.463768124580383 1;0 0.47826087474823 1;0 0.492753624916077 1;0 0.507246375083923 1;0 0.52173912525177 1;0 0.536231875419617 1;0 0.550724625587463 1;0 0.56521737575531 1;0 0.579710125923157 1;0 0.594202876091003 1;0 0.60869562625885 1;0 0.623188376426697 1;0 0.637681186199188 1;0 0.652173936367035 1;0 0.666666686534882 1;0 0.681159436702728 1;0 0.695652186870575 1;0 0.710144937038422 1;0 0.724637687206268 1;0 0.739130437374115 1;0 0.753623187541962 1;0 0.768115937709808 1;0 0.782608687877655 1;0 0.797101438045502 1;0 0.811594188213348 1;0 0.826086938381195 1;0 0.840579688549042 1;0 0.855072438716888 1;0 0.869565188884735 1;0 0.884057998657227 1;0 0.898550748825073 1;0 0.91304349899292 1;0 0.927536249160767 1;0 0.942028999328613 1;0 0.95652174949646 1;0 0.971014499664307 1;0 0.985507249832153 1;0 1 1;0.015625 1 0.984375;0.03125 1 0.96875;0.046875 1 0.953125;0.0625 1 0.9375;0.078125 1 0.921875;0.09375 1 0.90625;0.109375 1 0.890625;0.125 1 0.875;0.140625 1 0.859375;0.15625 1 0.84375;0.171875 1 0.828125;0.1875 1 0.8125;0.203125 1 0.796875;0.21875 1 0.78125;0.234375 1 0.765625;0.25 1 0.75;0.265625 1 0.734375;0.28125 1 0.71875;0.296875 1 0.703125;0.3125 1 0.6875;0.328125 1 0.671875;0.34375 1 0.65625;0.359375 1 0.640625;0.375 1 0.625;0.390625 1 0.609375;0.40625 1 0.59375;0.421875 1 0.578125;0.4375 1 0.5625;0.453125 1 0.546875;0.46875 1 0.53125;0.484375 1 0.515625;0.5 1 0.5;0.515625 1 0.484375;0.53125 1 0.46875;0.546875 1 0.453125;0.5625 1 0.4375;0.578125 1 0.421875;0.59375 1 0.40625;0.609375 1 0.390625;0.625 1 0.375;0.640625 1 0.359375;0.65625 1 0.34375;0.671875 1 0.328125;0.6875 1 0.3125;0.703125 1 0.296875;0.71875 1 0.28125;0.734375 1 0.265625;0.75 1 0.25;0.765625 1 0.234375;0.78125 1 0.21875;0.796875 1 0.203125;0.8125 1 0.1875;0.828125 1 0.171875;0.84375 1 0.15625;0.859375 1 0.140625;0.875 1 0.125;0.890625 1 0.109375;0.90625 1 0.09375;0.921875 1 0.078125;0.9375 1 0.0625;0.953125 1 0.046875;0.96875 1 0.03125;0.984375 1 0.015625;1 1 0;1 0.984375 0;1 0.96875 0;1 0.953125 0;1 0.9375 0;1 0.921875 0;1 0.90625 0;1 0.890625 0;1 0.875 0;1 0.859375 0;1 0.84375 0;1 0.828125 0;1 0.8125 0;1 0.796875 0;1 0.78125 0;1 0.765625 0;1 0.75 0;1 0.734375 0;1 0.71875 0;1 0.703125 0;1 0.6875 0;1 0.671875 0;1 0.65625 0;1 0.640625 0;1 0.625 0;1 0.609375 0;1 0.59375 0;1 0.578125 0;1 0.5625 0;1 0.546875 0;1 0.53125 0;1 0.515625 0;1 0.5 0;1 0.484375 0;1 0.46875 0;1 0.453125 0;1 0.4375 0;1 0.421875 0;1 0.40625 0;1 0.390625 0;1 0.375 0;1 0.359375 0;1 0.34375 0;1 0.328125 0;1 0.3125 0;1 0.296875 0;1 0.28125 0;1 0.265625 0;1 0.25 0;1 0.234375 0;1 0.21875 0;1 0.203125 0;1 0.1875 0;1 0.171875 0;1 0.15625 0;1 0.140625 0;1 0.125 0;1 0.109375 0;1 0.09375 0;1 0.078125 0;1 0.0625 0;1 0.046875 0;1 0.03125 0;1 0.015625 0;1 0 0;0.984375 0 0;0.96875 0 0;0.953125 0 0;0.9375 0 0;0.921875 0 0;0.90625 0 0;0.890625 0 0;0.875 0 0;0.859375 0 0;0.84375 0 0;0.828125 0 0;0.8125 0 0;0.796875 0 0;0.78125 0 0;0.765625 0 0;0.75 0 0;0.734375 0 0;0.71875 0 0;0.703125 0 0;0.6875 0 0;0.671875 0 0;0.65625 0 0;0.640625 0 0;0.625 0 0;0.609375 0 0;0.59375 0 0;0.578125 0 0;0.5625 0 0;0.546875 0 0;0.53125 0 0;0.515625 0 0;0.5 0 0];
colmap2=[1 1 1;0.954545438289642 1 1;0.909090936183929 1 1;0.863636374473572 1 1;0.818181812763214 1 1;0.772727251052856 1 1;0.727272748947144 1 1;0.681818187236786 1 1;0.636363625526428 1 1;0.590909063816071 1 1;0.545454561710358 1 1;0.5 1 1;0.454545468091965 1 1;0.409090906381607 1 1;0.363636374473572 1 1;0.318181812763214 1 1;0.272727280855179 1 1;0.227272734045982 1 1;0.181818187236786 1 1;0.136363640427589 1 1;0.0909090936183929 1 1;0.0454545468091965 1 1;0 1 1;0 0.989960789680481 0.989960789680481;0 0.979921579360962 0.979921579360962;0 0.969882369041443 0.969882369041443;0 0.959843158721924 0.959843158721924;0 0.949803948402405 0.949803948402405;0 0.939764738082886 0.939764738082886;0 0.929725468158722 0.929725468158722;0 0.919686257839203 0.919686257839203;0 0.909647047519684 0.909647047519684;0 0.899607837200165 0.899607837200165;0 0.889568626880646 0.889568626880646;0 0.879529416561127 0.879529416561127;0 0.869490206241608 0.869490206241608;0 0.859450995922089 0.859450995922089;0 0.84941178560257 0.84941178560257;0 0.839372575283051 0.839372575283051;0 0.829333364963531 0.829333364963531;0 0.819294154644012 0.819294154644012;0 0.809254884719849 0.809254884719849;0 0.79921567440033 0.79921567440033;0 0.789176464080811 0.789176464080811;0 0.779137253761292 0.779137253761292;0 0.769098043441772 0.769098043441772;0 0.759058833122253 0.759058833122253;0 0.749019622802734 0.749019622802734;0.00130718958098441 0.742008328437805 0.749970316886902;0.00261437916196883 0.734997034072876 0.750921010971069;0.00392156885936856 0.727985739707947 0.751871645450592;0.00522875832393765 0.720974445343018 0.75282233953476;0.00653594778850675 0.713963150978088 0.753773033618927;0.00784313771873713 0.706951916217804 0.754723727703094;0.00915032718330622 0.699940621852875 0.755674421787262;0.0104575166478753 0.692929327487946 0.756625115871429;0.0117647061124444 0.685918033123016 0.757575750350952;0.0130718955770135 0.678906738758087 0.75852644443512;0.0143790850415826 0.671895444393158 0.759477138519287;0.0156862754374743 0.664884150028229 0.760427832603455;0.0169934649020433 0.6578728556633 0.761378526687622;0.0183006543666124 0.65086156129837 0.762329161167145;0.0196078438311815 0.643850266933441 0.763279855251312;0.0209150332957506 0.636838972568512 0.76423054933548;0.0222222227603197 0.629827737808228 0.765181243419647;0.0235294122248888 0.622816443443298 0.766131937503815;0.0248366016894579 0.615805149078369 0.767082631587982;0.026143791154027 0.60879385471344 0.768033266067505;0.0274509806185961 0.601782560348511 0.768983960151672;0.0287581700831652 0.594771265983582 0.76993465423584;0.0300653595477343 0.587759971618652 0.770885348320007;0.0313725508749485 0.580748677253723 0.771836042404175;0.0326797403395176 0.573737382888794 0.772786676883698;0.0339869298040867 0.566726088523865 0.773737370967865;0.0352941192686558 0.559714794158936 0.774688065052032;0.0366013087332249 0.552703559398651 0.7756387591362;0.037908498197794 0.545692265033722 0.776589453220367;0.0392156876623631 0.538680970668793 0.777540147304535;0.0405228771269321 0.531669676303864 0.778490781784058;0.0418300665915012 0.524658381938934 0.779441475868225;0.0431372560560703 0.517647087574005 0.780392169952393;0.0421568639576435 0.505882382392883 0.785383284091949;0.0411764718592167 0.494117677211761 0.790374338626862;0.0401960797607899 0.48235297203064 0.795365452766418;0.0392156876623631 0.470588266849518 0.800356507301331;0.0382352955639362 0.458823561668396 0.805347621440887;0.0372549034655094 0.447058856487274 0.8103386759758;0.0362745113670826 0.435294151306152 0.815329790115356;0.0352941192686558 0.423529446125031 0.820320844650269;0.034313727170229 0.411764740943909 0.825311958789825;0.0333333350718021 0.400000035762787 0.830303013324738;0.0323529429733753 0.388235330581665 0.835294127464294;0.0313725508749485 0.376470595598221 0.840285241603851;0.0303921569138765 0.364705890417099 0.845276296138763;0.0294117648154497 0.352941185235977 0.85026741027832;0.0284313727170229 0.341176480054855 0.855258464813232;0.0274509806185961 0.329411774873734 0.860249578952789;0.0264705885201693 0.317647069692612 0.865240633487701;0.0254901964217424 0.30588236451149 0.870231747627258;0.0245098043233156 0.294117659330368 0.87522280216217;0.0235294122248888 0.282352954149246 0.880213916301727;0.022549020126462 0.270588248968124 0.885204970836639;0.0215686280280352 0.258823543787003 0.890196084976196;0.0205882359296083 0.247058838605881 0.895187199115753;0.0196078438311815 0.235294133424759 0.900178253650665;0.0186274517327547 0.223529428243637 0.905169367790222;0.0176470596343279 0.211764723062515 0.910160422325134;0.0166666675359011 0.200000017881393 0.915151536464691;0.0156862754374743 0.18823529779911 0.920142590999603;0.0147058824077249 0.176470592617989 0.92513370513916;0.013725490309298 0.164705887436867 0.930124759674072;0.0127450982108712 0.152941182255745 0.935115873813629;0.0117647061124444 0.141176477074623 0.940106928348541;0.0107843140140176 0.129411771893501 0.945098042488098;0.00980392191559076 0.117647066712379 0.950089156627655;0.00882352981716394 0.105882361531258 0.955080211162567;0.00784313771873713 0.0941176488995552 0.960071325302124;0.00686274515464902 0.0823529437184334 0.965062379837036;0.0058823530562222 0.0705882385373116 0.970053493976593;0.00490196095779538 0.0588235333561897 0.975044548511505;0.00392156885936856 0.0470588244497776 0.980035662651062;0.0029411765281111 0.0352941192686558 0.985026717185974;0.00196078442968428 0.0235294122248888 0.990017831325531;0.000980392214842141 0.0117647061124444 0.995008885860443;0 0 1;0.000881251413375139 0.00189469056203961 0.99493283033371;0.00176250282675028 0.00378938112407923 0.989865601062775;0.00264375424012542 0.00568407168611884 0.984798431396484;0.00352500565350056 0.00757876224815845 0.979731202125549;0.0044062570668757 0.00947345234453678 0.974664032459259;0.00528750848025084 0.0113681433722377 0.969596803188324;0.00616875989362597 0.013262833468616 0.964529633522034;0.00705001130700111 0.0151575244963169 0.959462463855743;0.00793126225471497 0.0170522145926952 0.954395234584808;0.00881251413375139 0.0189469046890736 0.949328064918518;0.00969376508146524 0.0208415947854519 0.944260835647583;0.0105750169605017 0.0227362867444754 0.939193665981293;0.0114562679082155 0.0246309768408537 0.934126436710358;0.0123375197872519 0.026525666937232 0.929059267044067;0.0132187707349658 0.0284203570336103 0.923992097377777;0.0141000226140022 0.0303150489926338 0.918924868106842;0.0149812735617161 0.0322097390890121 0.913857698440552;0.0158625245094299 0.0341044291853905 0.908790469169617;0.0167437773197889 0.0359991192817688 0.903723299503326;0.0176250282675028 0.0378938093781471 0.898656070232391;0.0185062792152166 0.0397884994745255 0.893588900566101;0.0193875301629305 0.0416831895709038 0.888521730899811;0.0202687829732895 0.0435778833925724 0.883454501628876;0.0211500339210033 0.0454725734889507 0.878387331962585;0.0220312848687172 0.0473672635853291 0.87332010269165;0.022912535816431 0.0492619536817074 0.86825293302536;0.02379378862679 0.0511566437780857 0.863185703754425;0.0246750395745039 0.053051333874464 0.858118534088135;0.0255562905222178 0.0549460239708424 0.853051364421844;0.0264375414699316 0.0568407140672207 0.847984135150909;0.0273187942802906 0.058735404163599 0.842916965484619;0.0282000452280045 0.0606300979852676 0.837849736213684;0.0290812961757183 0.062524788081646 0.832782566547394;0.0299625471234322 0.0644194781780243 0.827715337276459;0.0308437999337912 0.0663141682744026 0.822648167610168;0.0317250490188599 0.0682088583707809 0.817580997943878;0.032606303691864 0.0701035484671593 0.812513768672943;0.0334875546395779 0.0719982385635376 0.807446599006653;0.0343688055872917 0.0738929286599159 0.802379369735718;0.0352500565350056 0.0757876187562943 0.797312200069427;0.0361313074827194 0.0776823088526726 0.792244970798492;0.0370125584304333 0.0795769989490509 0.787177801132202;0.0378938093781471 0.0814716890454292 0.782110631465912;0.038775060325861 0.0833663791418076 0.777043402194977;0.0396563149988651 0.0852610766887665 0.771976232528687;0.040537565946579 0.0871557667851448 0.766909003257751;0.0414188168942928 0.0890504568815231 0.761841833591461;0.0423000678420067 0.0909451469779015 0.756774663925171;0.0431813187897205 0.0928398370742798 0.751707434654236;0.0440625697374344 0.0947345271706581 0.746640264987946;0.0449438206851482 0.0966292172670364 0.741573035717011;0.0458250716328621 0.0985239073634148 0.73650586605072;0.0467063263058662 0.100418597459793 0.731438636779785;0.0475875772535801 0.102313287556171 0.726371467113495;0.0484688282012939 0.10420797765255 0.721304297447205;0.0493500791490078 0.106102667748928 0.71623706817627;0.0502313300967216 0.107997357845306 0.711169898509979;0.0511125810444355 0.109892047941685 0.706102669239044;0.0519938319921494 0.111786738038063 0.701035499572754;0.0528750829398632 0.113681428134441 0.695968270301819;0.0537563376128674 0.11557611823082 0.690901100635529;0.0546375885605812 0.117470808327198 0.685833930969238;0.0555188395082951 0.119365505874157 0.680766701698303;0.0564000904560089 0.121260195970535 0.675699532032013;0.0572813414037228 0.123154886066914 0.670632302761078;0.0581625923514366 0.125049576163292 0.665565133094788;0.0590438432991505 0.12694425880909 0.660497903823853;0.0599250942468643 0.128838956356049 0.655430734157562;0.0608063489198685 0.130733639001846 0.650363564491272;0.0616875998675823 0.132628336548805 0.645296335220337;0.0625688508152962 0.134523019194603 0.640229165554047;0.0634500980377197 0.136417716741562 0.635161936283112;0.0643313527107239 0.138312414288521 0.630094766616821;0.065212607383728 0.140207096934319 0.625027537345886;0.0660938546061516 0.142101794481277 0.619960367679596;0.0669751092791557 0.143996477127075 0.614893198013306;0.0678563565015793 0.145891174674034 0.609825968742371;0.0687376111745834 0.147785857319832 0.60475879907608;0.069618858397007 0.149680554866791 0.599691569805145;0.0705001130700111 0.151575237512589 0.594624400138855;0.0713813677430153 0.153469935059547 0.58955717086792;0.0722626149654388 0.155364617705345 0.58449000120163;0.073143869638443 0.157259315252304 0.579422831535339;0.0740251168608665 0.159153997898102 0.574355602264404;0.0749063715338707 0.161048695445061 0.569288432598114;0.0757876187562943 0.162943378090858 0.564221203327179;0.0766688734292984 0.164838075637817 0.559154033660889;0.077550120651722 0.166732758283615 0.554086804389954;0.0784313753247261 0.168627455830574 0.549019634723663;0.0765639618039131 0.164612516760826 0.535947740077972;0.0746965482831001 0.160597577691078 0.522875845432281;0.0728291347622871 0.15658263862133 0.509803950786591;0.0709617212414742 0.152567699551582 0.4967320561409;0.0690943077206612 0.148552760481834 0.483660161495209;0.0672268941998482 0.144537821412086 0.470588266849518;0.0653594806790352 0.140522882342339 0.457516372203827;0.0634920671582222 0.136507943272591 0.444444477558136;0.0616246536374092 0.132493004202843 0.431372582912445;0.0597572401165962 0.128478065133095 0.418300688266754;0.0578898228704929 0.124463118612766 0.405228763818741;0.0560224093496799 0.120448179543018 0.39215686917305;0.054154995828867 0.11643324047327 0.379084974527359;0.052287582308054 0.112418301403522 0.366013079881668;0.050420168787241 0.108403362333775 0.352941185235977;0.048552755266428 0.104388423264027 0.339869290590286;0.046685341745615 0.100373484194279 0.326797395944595;0.044817928224802 0.0963585451245308 0.313725501298904;0.042950514703989 0.0923436060547829 0.300653606653214;0.041083101183176 0.0883286669850349 0.287581712007523;0.0392156876623631 0.084313727915287 0.274509817361832;0.0373482741415501 0.0802987888455391 0.261437922716141;0.0354808606207371 0.0762838497757912 0.24836602807045;0.0336134470999241 0.0722689107060432 0.235294133424759;0.0317460335791111 0.0682539716362953 0.222222238779068;0.0298786200582981 0.0642390325665474 0.209150344133377;0.02801120467484 0.0602240897715092 0.196078434586525;0.026143791154027 0.0562091507017612 0.183006539940834;0.024276377633214 0.0521942116320133 0.169934645295143;0.022408964112401 0.0481792725622654 0.156862750649452;0.020541550591588 0.0441643334925175 0.143790856003761;0.018674137070775 0.0401493944227695 0.13071896135807;0.016806723549962 0.0361344553530216 0.117647066712379;0.0149393100291491 0.0321195162832737 0.104575172066689;0.0130718955770135 0.0281045753508806 0.091503269970417;0.0112044820562005 0.0240896362811327 0.0784313753247261;0.00933706853538752 0.0200746972113848 0.0653594806790352;0.00746965501457453 0.0160597581416368 0.0522875860333443;0.00560224102810025 0.0120448181405663 0.0392156876623631;0.00373482750728726 0.00802987907081842 0.0261437930166721;0.00186741375364363 0.00401493953540921 0.0130718965083361;0 0 0];
colmap3=[1 1 1;0.985714256763458 0.985714256763458 1;0.971428573131561 0.971428573131561 1;0.95714282989502 0.95714282989502 1;0.942857146263123 0.942857146263123 1;0.928571403026581 0.928571403026581 1;0.914285719394684 0.914285719394684 1;0.899999976158142 0.899999976158142 1;0.885714292526245 0.885714292526245 1;0.871428549289703 0.871428549289703 1;0.857142865657806 0.857142865657806 1;0.842857122421265 0.842857122421265 1;0.828571438789368 0.828571438789368 1;0.814285695552826 0.814285695552826 1;0.800000011920929 0.800000011920929 1;0.785714268684387 0.785714268684387 1;0.77142858505249 0.77142858505249 1;0.757142841815948 0.757142841815948 1;0.742857158184052 0.742857158184052 1;0.72857141494751 0.72857141494751 1;0.714285731315613 0.714285731315613 1;0.699999988079071 0.699999988079071 1;0.685714304447174 0.685714304447174 1;0.671428561210632 0.671428561210632 1;0.657142877578735 0.657142877578735 1;0.642857134342194 0.642857134342194 1;0.628571450710297 0.628571450710297 1;0.614285707473755 0.614285707473755 1;0.600000023841858 0.600000023841858 1;0.585714280605316 0.585714280605316 1;0.571428596973419 0.571428596973419 1;0.557142853736877 0.557142853736877 1;0.54285717010498 0.54285717010498 1;0.528571426868439 0.528571426868439 1;0.514285743236542 0.514285743236542 1;0.5 0.5 1;0.485714286565781 0.485714286565781 1;0.471428573131561 0.471428573131561 1;0.457142859697342 0.457142859697342 1;0.442857146263123 0.442857146263123 1;0.428571432828903 0.428571432828903 1;0.414285719394684 0.414285719394684 1;0.400000005960464 0.400000005960464 1;0.385714292526245 0.385714292526245 1;0.371428579092026 0.371428579092026 1;0.357142865657806 0.357142865657806 1;0.342857152223587 0.342857152223587 1;0.328571438789368 0.328571438789368 1;0.314285725355148 0.314285725355148 1;0.300000011920929 0.300000011920929 1;0.28571429848671 0.28571429848671 1;0.27142858505249 0.27142858505249 1;0.257142871618271 0.257142871618271 1;0.24285714328289 0.24285714328289 1;0.228571429848671 0.228571429848671 1;0.214285716414452 0.214285716414452 1;0.200000002980232 0.200000002980232 1;0.185714289546013 0.185714289546013 1;0.171428576111794 0.171428576111794 1;0.157142862677574 0.157142862677574 1;0.142857149243355 0.142857149243355 1;0.128571435809135 0.128571435809135 1;0.114285714924335 0.114285714924335 1;0.100000001490116 0.100000001490116 1;0.0857142880558968 0.0857142880558968 1;0.0714285746216774 0.0714285746216774 1;0.0571428574621677 0.0571428574621677 1;0.0428571440279484 0.0428571440279484 1;0.0285714287310839 0.0285714287310839 1;0.0142857143655419 0.0142857143655419 1;0 0 1;0 0.0166666675359011 1;0 0.0333333350718021 1;0 0.0500000007450581 1;0 0.0666666701436043 1;0 0.0833333358168602 1;0 0.100000001490116 1;0 0.116666667163372 1;0 0.133333340287209 1;0 0.150000005960464 1;0 0.16666667163372 1;0 0.183333337306976 1;0 0.200000002980232 1;0 0.216666668653488 1;0 0.233333334326744 1;0 0.25 1;0 0.266666680574417 1;0 0.283333331346512 1;0 0.300000011920929 1;0 0.316666662693024 1;0 0.333333343267441 1;0 0.349999994039536 1;0 0.366666674613953 1;0 0.383333325386047 1;0 0.400000005960464 1;0 0.416666656732559 1;0 0.433333337306976 1;0 0.449999988079071 1;0 0.466666668653488 1;0 0.483333319425583 1;0 0.5 1;0 0.516666650772095 1;0 0.533333361148834 1;0 0.550000011920929 1;0 0.566666662693024 1;0 0.583333313465118 1;0 0.600000023841858 1;0 0.616666674613953 1;0 0.633333325386047 1;0 0.649999976158142 1;0 0.666666686534882 1;0 0.683333337306976 1;0 0.699999988079071 1;0 0.716666638851166 1;0 0.733333349227905 1;0 0.75 1;0 0.766666650772095 1;0 0.783333361148834 1;0 0.800000011920929 1;0 0.816666662693024 1;0 0.833333313465118 1;0 0.850000023841858 1;0 0.866666674613953 1;0 0.883333325386047 1;0 0.899999976158142 1;0 0.916666686534882 1;0 0.933333337306976 1;0 0.949999988079071 1;0 0.966666638851166 1;0 0.983333349227905 1;0 1 1;0.0227272734045982 1 0.977272748947144;0.0454545468091965 1 0.954545438289642;0.0681818202137947 1 0.931818187236786;0.0909090936183929 1 0.909090936183929;0.113636367022991 1 0.886363625526428;0.136363640427589 1 0.863636374473572;0.159090906381607 1 0.840909063816071;0.181818187236786 1 0.818181812763214;0.204545453190804 1 0.795454561710358;0.227272734045982 1 0.772727251052856;0.25 1 0.75;0.272727280855179 1 0.727272748947144;0.295454531908035 1 0.704545438289642;0.318181812763214 1 0.681818187236786;0.340909093618393 1 0.659090936183929;0.363636374473572 1 0.636363625526428;0.386363625526428 1 0.613636374473572;0.409090906381607 1 0.590909063816071;0.431818187236786 1 0.568181812763214;0.454545468091965 1 0.545454561710358;0.477272719144821 1 0.522727251052856;0.5 1 0.5;0.522727251052856 1 0.477272719144821;0.545454561710358 1 0.454545468091965;0.568181812763214 1 0.431818187236786;0.590909063816071 1 0.409090906381607;0.613636374473572 1 0.386363625526428;0.636363625526428 1 0.363636374473572;0.659090936183929 1 0.340909093618393;0.681818187236786 1 0.318181812763214;0.704545438289642 1 0.295454531908035;0.727272748947144 1 0.272727280855179;0.75 1 0.25;0.772727251052856 1 0.227272734045982;0.795454561710358 1 0.204545453190804;0.818181812763214 1 0.181818187236786;0.840909063816071 1 0.159090906381607;0.863636374473572 1 0.136363640427589;0.886363625526428 1 0.113636367022991;0.909090936183929 1 0.0909090936183929;0.931818187236786 1 0.0681818202137947;0.954545438289642 1 0.0454545468091965;0.977272748947144 1 0.0227272734045982;1 1 0;1 0.981132090091705 0;1 0.962264180183411 0;1 0.943396210670471 0;1 0.924528300762177 0;1 0.905660390853882 0;1 0.886792480945587 0;1 0.867924511432648 0;1 0.849056601524353 0;1 0.830188691616058 0;1 0.811320781707764 0;1 0.792452812194824 0;1 0.77358490228653 0;1 0.754716992378235 0;1 0.73584908246994 0;1 0.716981112957001 0;1 0.698113203048706 0;1 0.679245293140411 0;1 0.660377383232117 0;1 0.641509413719177 0;1 0.622641503810883 0;1 0.603773593902588 0;1 0.584905683994293 0;1 0.566037714481354 0;1 0.547169804573059 0;1 0.528301894664764 0;1 0.50943398475647 0;1 0.490566045045853 0;1 0.471698105335236 0;1 0.452830195426941 0;1 0.433962255716324 0;1 0.415094345808029 0;1 0.396226406097412 0;1 0.377358496189117 0;1 0.3584905564785 0;1 0.339622646570206 0;1 0.320754706859589 0;1 0.301886796951294 0;1 0.283018857240677 0;1 0.264150947332382 0;1 0.245283022522926 0;1 0.22641509771347 0;1 0.207547172904015 0;1 0.188679248094559 0;1 0.169811323285103 0;1 0.150943398475647 0;1 0.132075473666191 0;1 0.113207548856735 0;1 0.0943396240472794 0;1 0.0754716992378235 0;1 0.0566037744283676 0;1 0.0377358496189117 0;1 0.0188679248094559 0;1 0 0;0.982142865657806 0 0;0.964285731315613 0 0;0.946428596973419 0 0;0.928571403026581 0 0;0.910714268684387 0 0;0.892857134342194 0 0;0.875 0 0;0.857142865657806 0 0;0.839285731315613 0 0;0.821428596973419 0 0;0.803571403026581 0 0;0.785714268684387 0 0;0.767857134342194 0 0;0.75 0 0;0.732142865657806 0 0;0.714285731315613 0 0;0.696428596973419 0 0;0.678571403026581 0 0;0.660714268684387 0 0;0.642857134342194 0 0;0.625 0 0;0.607142865657806 0 0;0.589285731315613 0 0;0.571428596973419 0 0;0.553571403026581 0 0;0.535714268684387 0 0;0.517857134342194 0 0;0.5 0 0];


date=datenum(2009,8,25,0,0,0)+time(i+1)/24/60/60;
date_str=datestr(date,31);

[h_scatter,h_contour,h_annot]=createfltplot(x_rho,y_rho,xfloat(:,i),yfloat(:,i),dfloat(:,i),h,date_str,'Larvae',-1,40,flipud(jet(256)));
%[h_scatter,h_contour,h_annot]=createfltplot(x_rho,y_rho,xfloat(:,i),yfloat(:,i),dfloat(:,i),h,date_str,'Larvae',-1,40,flipud(winter(256)));
drawnow
%set(figure(1),'OuterPosition',[0 0 320 700])%[0 0 400 800]%[0 0 290 620]

%for i=3:3:imax-1%336 %imax-1  %i=1:imax-1
for i=1:1:imax-1%336 %imax-1  %i=1:imax-1
    
date=datenum(2009,8,25,0,0,0)+time(i+1)/24/60/60;
date_str=datestr(date,31);

set(h_scatter,'XData',xfloat(:,i),'YData',yfloat(:,i),'CData',dfloat(:,i))
set(h_annot,'String',date_str)

drawnow
%hgexport(figure(1), strcat('output/figs_png\f01_',num2str(i,'%0.4u'),'.png'),hgexport('factorystyle'),'Format','png');

end



