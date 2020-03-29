
A=fscanfMat("spectre_plasma.dat");
B=fscanfMat("spectre_laser.dat");
clf(0);
plot(A(:,1),A(:,2))
xtitle(" Spectre du plasma He-Ne","Longueur d''onde (nm)","Intensite (u.a)")
scf(1)
clf(1)
plot(B(:,1),B(:,2))
xtitle(" Spectre du laser He-Ne","Longueur d onde (nm)","Intensite (u.a)")
