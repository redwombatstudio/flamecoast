";add_property($ansi, \"esc\", \"\", {#3, \"r\"});";

;add_property($ansi, "reset", tostr($ansi.esc, "[0m"), {#3, "r"});
;add_property($ansi, "bold_on", tostr($ansi.esc, "[1m"), {#3, "r"});
;add_property($ansi, "bold_off", tostr($ansi.esc, "[22m"), {#3, "r"});
;add_property($ansi, "black", tostr($ansi.esc, "[30m"), {#3, "r"});
;add_property($ansi, "red", tostr($ansi.esc, "[31m"), {#3, "r"});
;add_property($ansi, "green", tostr($ansi.esc, "[32m"), {#3, "r"});
;add_property($ansi, "yellow", tostr($ansi.esc, "[33m"), {#3, "r"});
;add_property($ansi, "blue", tostr($ansi.esc, "[34m"), {#3, "r"});
;add_property($ansi, "magenta", tostr($ansi.esc, "[35m"), {#3, "r"});
;add_property($ansi, "cyan", tostr($ansi.esc, "[36m"), {#3, "r"});
;add_property($ansi, "white", tostr($ansi.esc, "[37m"), {#3, "r"});
;add_property($ansi, "black_bg", tostr($ansi.esc, "[40m"), {#3, "r"});
;add_property($ansi, "red_bg", tostr($ansi.esc, "[41m"), {#3, "r"});
;add_property($ansi, "green_bg", tostr($ansi.esc, "[42m"), {#3, "r"});
;add_property($ansi, "yellow_bg", tostr($ansi.esc, "[43m"), {#3, "r"});
;add_property($ansi, "blue_bg", tostr($ansi.esc, "[44m"), {#3, "r"});
;add_property($ansi, "magenta_bg", tostr($ansi.esc, "[45m"), {#3, "r"});
;add_property($ansi, "cyan_bg", tostr($ansi.esc, "[46m"), {#3, "r"});
;add_property($ansi, "white_bg", tostr($ansi.esc, "[47m"), {#3, "r"});

