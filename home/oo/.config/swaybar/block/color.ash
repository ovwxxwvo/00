#!/usr/bin/env dash


# pr vd rh | 4 6 8
  clr_gypr=#808080 ;  clr_gyvd=#808080 ;  clr_gyrh=#808080 ;
  clr_repr=#e02020 ;  clr_revd=#d03030 ;  clr_rerh=#c04040 ;
  clr_orpr=#e08020 ;  clr_orvd=#d08030 ;  clr_orrh=#c08040 ;
  clr_yepr=#e0e020 ;  clr_yevd=#d0d030 ;  clr_yerh=#c0c040 ;
  clr_lepr=#80e020 ;  clr_levd=#80d030 ;  clr_lerh=#80c040 ;
  clr_grpr=#20e020 ;  clr_grvd=#30d030 ;  clr_grrh=#40c040 ;
  clr_sgpr=#20e080 ;  clr_sgvd=#30d080 ;  clr_sgrh=#40c080 ;
  clr_cypr=#20e0e0 ;  clr_cyvd=#30d0d0 ;  clr_cyrh=#40c0c0 ;
  clr_sbpr=#2080e0 ;  clr_sbvd=#3080d0 ;  clr_sbrh=#4080c0 ;
  clr_blpr=#2020e0 ;  clr_blvd=#3030d0 ;  clr_blrh=#4040c0 ;
  clr_vipr=#8020e0 ;  clr_vivd=#8030d0 ;  clr_virh=#8040c0 ;
  clr_mapr=#e020e0 ;  clr_mavd=#d030d0 ;  clr_marh=#c040c0 ;
  clr_pipr=#e02080 ;  clr_pivd=#d03080 ;  clr_pirh=#c04080 ;

# gy dt sk | 14 12 10
  clr_gygy=#808080 ;  clr_gydt=#808080 ;  clr_gysk=#808080 ;
  clr_regy=#907070 ;  clr_redt=#a06060 ;  clr_resk=#b05050 ;
  clr_orgy=#908070 ;  clr_ordt=#a08060 ;  clr_orsk=#b08050 ;
  clr_yegy=#909070 ;  clr_yedt=#a0a060 ;  clr_yesk=#b0b050 ;
  clr_legy=#809070 ;  clr_ledt=#80a060 ;  clr_lesk=#80b050 ;
  clr_grgy=#709070 ;  clr_grdt=#60a060 ;  clr_grsk=#50b050 ;
  clr_sggy=#709080 ;  clr_sgdt=#60a080 ;  clr_sgsk=#50b080 ;
  clr_cygy=#709090 ;  clr_cydt=#60a0a0 ;  clr_cysk=#50b0b0 ;
  clr_sbgy=#708090 ;  clr_sbdt=#6080a0 ;  clr_sbsk=#5080b0 ;
  clr_blgy=#707090 ;  clr_bldt=#6060a0 ;  clr_blsk=#5050b0 ;
  clr_vigy=#807090 ;  clr_vidt=#8060a0 ;  clr_visk=#8050b0 ;
  clr_magy=#907090 ;  clr_madt=#a060a0 ;  clr_mask=#b050b0 ;
  clr_pigy=#907080 ;  clr_pidt=#a06080 ;  clr_pisk=#b05080 ;

# bk dk dp | 30 26 22
  clr_gybk=#101010 ;  clr_gydk=#303030 ;  clr_gydp=#505050 ;
  clr_rebk=#200000 ;  clr_redk=#600000 ;  clr_redp=#a00000 ;
  clr_orbk=#201000 ;  clr_ordk=#603000 ;  clr_ordp=#a05000 ;
  clr_yebk=#202000 ;  clr_yedk=#606000 ;  clr_yedp=#a0a000 ;
  clr_lebk=#102000 ;  clr_ledk=#306000 ;  clr_ledp=#50a000 ;
  clr_grbk=#002000 ;  clr_grdk=#006000 ;  clr_grdp=#00a000 ;
  clr_sgbk=#002010 ;  clr_sgdk=#006030 ;  clr_sgdp=#00a050 ;
  clr_cybk=#002020 ;  clr_cydk=#006060 ;  clr_cydp=#00a0a0 ;
  clr_sbbk=#001020 ;  clr_sbdk=#003060 ;  clr_sbdp=#0050a0 ;
  clr_blbk=#000020 ;  clr_bldk=#000060 ;  clr_bldp=#0000a0 ;
  clr_vibk=#100020 ;  clr_vidk=#300060 ;  clr_vidp=#5000a0 ;
  clr_mabk=#200020 ;  clr_madk=#600060 ;  clr_madp=#a000a0 ;
  clr_pibk=#200010 ;  clr_pidk=#600030 ;  clr_pidp=#a00050 ;

# wt lt sl | 46 42 38
  clr_gywt=#f0f0f0 ;  clr_gylt=#d0d0d0 ;  clr_gysl=#b0b0b0 ;
  clr_rewt=#ffe0e0 ;  clr_relt=#ffa0a0 ;  clr_resl=#ff6060 ;
  clr_orwt=#fff0e0 ;  clr_orlt=#ffd0a0 ;  clr_orsl=#ffb060 ;
  clr_yewt=#ffffe0 ;  clr_yelt=#ffffa0 ;  clr_yesl=#ffff60 ;
  clr_lewt=#f0ffe0 ;  clr_lelt=#d0ffa0 ;  clr_lesl=#b0ff60 ;
  clr_grwt=#e0ffe0 ;  clr_grlt=#a0ffa0 ;  clr_grsl=#60ff60 ;
  clr_sgwt=#e0fff0 ;  clr_sglt=#a0ffd0 ;  clr_sgsl=#60ffb0 ;
  clr_cywt=#e0ffff ;  clr_cylt=#a0ffff ;  clr_cysl=#60ffff ;
  clr_sbwt=#e0f0ff ;  clr_sblt=#a0d0ff ;  clr_sbsl=#60b0ff ;
  clr_blwt=#e0e0ff ;  clr_bllt=#a0a0ff ;  clr_blsl=#6060ff ;
  clr_viwt=#f0e0ff ;  clr_vilt=#d0a0ff ;  clr_visl=#b060ff ;
  clr_mawt=#ffe0ff ;  clr_malt=#ffa0ff ;  clr_masl=#ff60ff ;
  clr_piwt=#ffe0f0 ;  clr_pilt=#ffa0d0 ;  clr_pisl=#ff60b0 ;


