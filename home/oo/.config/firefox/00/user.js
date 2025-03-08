// Firefox config, standalone web browser from mozilla
// Maintainer:	Jessee Chan <CYPHER0@foxmail.com>
// Last Change: 2023.12.18


// user_pref("", --);

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true  );
user_pref("browser.backspace_action"                           , 0     );
user_pref("browser.link.open_newwindow"                        , 3     );
user_pref("browser.link.open_newwindow.restriction"            , 0     );
user_pref("network.http.max-persistent-connections-per-server" , 2     );

user_pref("ui.systemUsesDarkTheme"                             , 1     );
user_pref("layout.css.prefers-color-scheme.content-override"   , 3     );
user_pref("layout.css.devPixelsPerPx"                          , "1.4" );

user_pref("toolkit.telemetry.reportingpolicy.firstRun" , false );
user_pref("app.shield.optoutstudies.enabled "          , false );
user_pref("datareporting.healthreport.uploadEnabled"   , false );


