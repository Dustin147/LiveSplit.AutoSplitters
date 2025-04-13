state("Anno1602") {
    byte startFlag : "Anno1602.exe", 0x5C4ECC;
    byte stopFlag  : "Anno1602.exe", 0x5F10E0;
}

startup {
    settings.Add("start", true, "Start when startFlag changes from 7 to 0");
    settings.Add("stop", true, "Stop when stopFlag changes from 12 to 9");
}

start {
    return old.startFlag == 7 && current.startFlag == 0;
}

split {
    return false; // Kein Zwischen-Split
}

reset {
    return false; // Kein Auto-Reset
}

stop {
    return old.stopFlag == 12 && current.stopFlag == 9;
}

isLoading {
    return false; // Keine Ladezeiten-Erkennung
}

gameTime {
    return 0;
}

update {
    // Keine weitere Logik nötig
}
