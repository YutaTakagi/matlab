#!/bin/bash
#

# img_dir=$2
# tag=$1



tag='Shiraho_unconstrained_seagrass_with_SGD'

# name='0002'


# name='sediment_SOM'
# name='seagrass'
name='sediment_OCN'
# name='ocean_physical'
# name='ocean_CHEMs'
# name='sediment_CHEMs'
# name='ocean_DOM_POM'
# name='ocean_CHEMs_plankton'


img_dir=figs_png_${name}






echo -n ${img_dir}

# case ${img_dir} in
#   'figs_png_0001')
#     name='Temperature'
#     ;;
#   'figs_png_0002')
#     name='Salinity'
#     ;;
#   'figs_png_0003')
#     name='DIC'
#     ;;
#   'figs_png_0004')
#     name='TA'
#     ;;
#   'figs_png_0005')
#     name='DO'
#     ;;
#   'figs_png_0006')
#     name='delta13C_DIC'
#     ;;
#   'figs_png_0007')
#     name='Hs'
#     ;;
#   'figs_png_0008')
#     name='pH'
#     ;;
#   'figs_png_0009')
#     name='Omega_'
#     ;;
#   'figs_png_0010')
#     name='pCO2'
#     ;;
#   'figs_png_0011')
#     name='SS'
#     ;;
#   'figs_png_0012')
#     name='Coral_Pg'
#     ;;
#   'figs_png_0013')
#     name='Coral_Pn'
#     ;;
#   'figs_png_0014')
#     name='Coral_R'
#     ;;
#   'figs_png_0015')
#     name='Coral_G'
#     ;;
#   'figs_png_0016')
#     name='Coral_org-C'
#     ;;
#   'figs_png_0017')
#     name='Coral_delta13C_org-C'
#     ;;
#   'figs_png_0018')
#     name='Sediment_thickness'
#     ;;
#   'figs_png_0019')
#     name='Coral1_zoox_density'
#     ;;
#   'figs_png_0020')
#     name='Coral_growth_rate'
#     ;;
#   'figs_png_0021')
#     name='Coral_mortality'
#     ;;
#   'figs_png_0022')
#     name='Sea_surface_elevation'
#     ;;
#   'figs_png_0023')
#     name='Phytoplankton1'
#     ;;
#   'figs_png_0024')
#     name='Phytoplankton2'
#     ;;
#   'figs_png_0025')
#     name='Phytoplankton'
#     ;;
#   'figs_png_0026')
#     name='NO3'
#     ;;
#   'figs_png_0027')
#     name='NO2'
#     ;;
#   'figs_png_0028')
#     name='NH4'
#     ;;
#   'figs_png_0029')
#     name='PO4'
#     ;;
#   'figs_png_0030')
#     name='SS_200um'
#     ;;
#   'figs_png_0031')
#     name='Chl_a'
#     ;;
#   'figs_png_0032')
#     name='Chl_a'
#     ;;
#   'figs_png_0033')
#     name='Coral2_zoox_density'
#     ;;
#   'figs_png_0034')
#     name='Coral2_zoox_density'
#     ;;
#   'figs_png_0035')
#     name='DOC'
#     ;;
#   'figs_png_0036')
#     name='Coral_mortality_rate'
#     ;;
#   'figs_png_0051')
#     name='Sediment_Temperature'
#     ;;
#   'figs_png_0052')
#     name='Sediment_Salinity'
#     ;;
#   'figs_png_0053')
#     name='Sediment_TA'
#     ;;
#   'figs_png_0054')
#     name='Sediment_DO'
#     ;;
#   'figs_png_0055')
#     name='Sediment_DIC'
#     ;;
#   'figs_png_0056')
#     name='Sediment_N2'
#     ;;
#   'figs_png_0057')
#     name='Sediment_DOC_Labile'
#     ;;
#   'figs_png_0058')
#     name='Sediment_DOC_Refractory'
#     ;;
#   'figs_png_0059')
#     name='Sediment_POC_Labile'
#     ;;
#   'figs_png_0060')
#     name='Sediment_POC_Refractory'
#     ;;
#   'figs_png_0061')
#     name='Sediment_POC_Non-degradable'
#     ;;
#   'figs_png_0062')
#     name='Sediment_NO3'
#     ;;
#   'figs_png_0063')
#     name='Sediment_NH4'
#     ;;
#   'figs_png_0064')
#     name='Sediment_PO4'
#     ;;
#   'figs_png_0065')
#     name='Sediment_DON_Labile'
#     ;;
#   'figs_png_0066')
#     name='Sediment_DON_Refractory'
#     ;;
#   'figs_png_0067')
#     name='Sediment_PON_Labile'
#     ;;
#   'figs_png_0068')
#     name='Sediment_PON_Refractory'
#     ;;
#   'figs_png_0069')
#     name='Sediment_PON_Non_degradable'
#     ;;
#   'figs_png_0070')
#     name='Sediment_DOP_Labile'
#     ;;
#   'figs_png_0071')
#     name='Sediment_DOP_Refractory'
#     ;;
#   'figs_png_0072')
#     name='Sediment_POP_Labile'
#     ;;
#   'figs_png_0073')
#     name='Sediment_POP_Refractory'
#     ;;
#   'figs_png_0074')
#     name='Sediment_POP_Non_degradable'
#     ;;
#   'figs_png_0075')
#     name='Sediment_Mn2'
#     ;;
#   'figs_png_0076')
#     name='Sediment_MnO2'
#     ;;
#   'figs_png_0077')
#     name='Sediment_Fe2'
#     ;;
#   'figs_png_0078')
#     name='Sediment_FeS'
#     ;;
#   'figs_png_0079')
#     name='Sediment_FeS2'
#     ;;
#   'figs_png_0080')
#     name='Sediment_FeOOH'
#     ;;
#   'figs_png_0081')
#     name='Sediment_FeOOH_PO4'
#     ;;
#   'figs_png_0082')
#     name='Sediment_H2S'
#     ;;
#   'figs_png_0083')
#     name='Sediment_SO4'
#     ;;
#   'figs_png_0084')
#     name='Sediment_S0'
#     ;;  
#   'figs_png_1001')
#     name='Air_temperature'
#     ;;
#   'figs_png_1002')
#     name='Air_pressure'
#     ;;
#   'figs_png_1003')
#     name='Humidity'
#     ;;
#   'figs_png_1004')
#     name='Rain_fall_rate'
#     ;;
#   'figs_png_1005')
#     name='Cloud_fraction'
#     ;;
#   'figs_png_0101')
#     name='DOC'
#     ;;
#   'figs_png_0102')
#     name='DON'
#     ;;
#   'figs_png_0103')
#     name='DOP'
#     ;;
#   'figs_png_0104')
#     name='POC'
#     ;;
#   'figs_png_0105')
#     name='PON'
#     ;;
#   'figs_png_0106')
#     name='POP'
#     ;;
#   'figs_png_0201')
#     name='SgCBm'
#     ;;
#   'figs_png_0202')
#     name='LfCBm'
#     ;;
#   'figs_png_0203')
#     name='RtCBm'
#     ;;
#   'figs_png_0204')
#     name='ELAP'
#     ;;
#   'figs_png_0205')
#     name='TotSgCBm'
#     ;;
#   'figs_png_0206')
#     name='TotLfCBm'
#     ;;
#   'figs_png_0207')
#     name='TotRtCBm'
#     ;;
#   'figs_png_0208')
#     name='LA'
#     ;;
#   'figs_png_0221')
#     name='Phot'
#     ;;
#   'figs_png_0222')
#     name='Phot_Limiting'
#     ;;
#   'figs_png_0223')
#     name='Resp'
#     ;;
#   'figs_png_0224')
#     name='Net_Phot'
#     ;;
#   'figs_png_0225')
#     name='Dieoff'
#     ;;
#   *)
#     printf "\nfolder not found\n"
#     read -p 'Output folder name?: ' name
#     ;;
# esac

printf "file '%s'\n" ${img_dir}/*.png > imglist.txt

#ffmpeg -r:v 30 -f concat -i imglist.txt -codec:v libx264 -pix_fmt yuv420p -crf 22 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -an anim/${tag}_${name}.mp4
ffmpeg -r:v 24 -f concat -i imglist.txt -codec:v libx264 -pix_fmt yuv420p -crf 22 -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -an anim/${tag}_${name}.mp4
#
# -r:v 30 => 30 frame per sec.
