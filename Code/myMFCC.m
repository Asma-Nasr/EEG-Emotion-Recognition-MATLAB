nc=12;p= 16;n=512;inc=102;

c_FP1=melcepst(filFP1,250,'M',nc,p,n,inc);
c_FP2=melcepst(filFP2,250,'M',nc,p,n,inc);
c_F7=melcepst(filF7,250,'M',nc,p,n,inc);
c_F3=melcepst(filF3,250,'M',nc,p,n,inc);
c_FZ=melcepst(filFZ,250,'M',nc,p,n,inc);
c_F4=melcepst(filF4,250,'M',nc,p,n,inc);
c_F8=melcepst(filF8,250,'M',nc,p,n,inc);
c_T7=melcepst(filT7,250,'M',nc,p,n,inc);
c_C3=melcepst(filC3,250,'M',nc,p,n,inc);
c_CZ=melcepst(filCZ,250,'M',nc,p,n,inc);
c_C4=melcepst(filC4,250,'M',nc,p,n,inc);
c_T8=melcepst(filT8,250,'M',nc,p,n,inc);
c_P7=melcepst(filP7,250,'M',nc,p,n,inc);
c_P3=melcepst(filP3,250,'M',nc,p,n,inc);
c_PZ=melcepst(filPZ,250,'M',nc,p,n,inc);
c_P4=melcepst(filP4,250,'M',nc,p,n,inc);
c_P8=melcepst(filP8,250,'M',nc,p,n,inc);
c_O1=melcepst(filO1,250,'M',nc,p,n,inc);
c_O2=melcepst(filO2,250,'M',nc,p,n,inc);

FE_C=[c_FP1,c_FP2,c_F7,c_F3,c_FZ,c_F4,c_F8,c_T7,c_C3,c_CZ,c_C4,c_T8,c_P7,c_P3,c_PZ,c_P4,c_P8,c_O1,c_O2]';
