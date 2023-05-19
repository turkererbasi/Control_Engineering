L = tf(25,[1 10 10 10]);
DM = diskmargin(L);
diskmarginplot(DM.GainMargin)
diskmarginplot(DM.GainMargin,'disk')