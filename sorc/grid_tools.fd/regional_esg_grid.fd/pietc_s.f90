!> @file
!! @author R. J. Purser @date 2014
!! Some of the commonly used constants (pi etc)
!! ms10 etc are needed to satisfy the some (eg., gnu fortran) compilers'
!! more rigorous standards regarding the way "data" statements are initialized.
!! Zero and the first few units are u0,u1,u2, etc., their reciprocals being,
!! o2,o3 etc and their square roots, r2,r3. Reciprocal roots are or2,or3 etc.
!!
module pietc_s
use pkind, only: sp,spc
implicit none
logical ,parameter:: T=.true.,F=.false. !<- for pain-relief in logical ops
real(sp),parameter:: &

     
u1=1_sp,mu1=-u1,u2=2_sp,mu2=-u2,u3=3_sp,mu3=-u3,u4=4_sp,       &
     mu4=-u4,u5=5_sp,mu5=-u5,u6=6_sp,mu6=-u6,o2=u1/u2,o3=u1/u3,o4=u1/u4,    &
     o5=u1/u5,o6=u1/u6,mo2=-o2,mo3=-o3,mo4=-o4,mo5=-o5,mo6=-06,             &
     pi =3.1415926535897932384626433832795028841971693993751058209749e0_sp, &
     pi2=6.2831853071795864769252867665590057683943387987502116419498e0_sp, &
     pih=1.5707963267948966192313216916397514420985846996875529104874e0_sp, &
     rpi=1.7724538509055160272981674833411451827975494561223871282138e0_sp, &
! Important square-roots
     r2 =1.4142135623730950488016887242096980785696718753769480731766e0_sp, &
     r3 =1.7320508075688772935274463415058723669428052538103806280558e0_sp, &
     r5 =2.2360679774997896964091736687312762354406183596115257242708e0_sp, &
     or2=u1/r2,or3=u1/r3,or5=u1/r5,                                         &
! Golden number:
     phi=1.6180339887498948482045868343656381177203091798057628621354e0_sp, &
! Euler-Mascheroni constant:
     euler=0.57721566490153286060651209008240243104215933593992359880e0_sp, &
! Degree to radians; radians to degrees:
     dtor=pi/180,rtod=180/pi,                                               & 
! Sines of all main fractions of 90 degrees (down to ninths):
     s10=.173648177666930348851716626769314796000375677184069387236241e0_sp,&
     s11=.195090322016128267848284868477022240927691617751954807754502e0_sp,&
     s13=.222520933956314404288902564496794759466355568764544955311987e0_sp,&
     s15=.258819045102520762348898837624048328349068901319930513814003e0_sp,&
     s18=.309016994374947424102293417182819058860154589902881431067724e0_sp,&
     s20=.342020143325668733044099614682259580763083367514160628465048e0_sp,&
     s22=.382683432365089771728459984030398866761344562485627041433800e0_sp,&
     s26=.433883739117558120475768332848358754609990727787459876444547e0_sp,&
     s30=o2,                                                                &
     s34=.555570233019602224742830813948532874374937190754804045924153e0_sp,&
     s36=.587785252292473129168705954639072768597652437643145991072272e0_sp,&
     s39=.623489801858733530525004884004239810632274730896402105365549e0_sp,&
     s40=.642787609686539326322643409907263432907559884205681790324977e0_sp,&
     s45=or2,                                                               &
     s50=.766044443118978035202392650555416673935832457080395245854045e0_sp,&
     s51=.781831482468029808708444526674057750232334518708687528980634e0_sp,&
     s54=.809016994374947424102293417182819058860154589902881431067724e0_sp,&
     s56=.831469612302545237078788377617905756738560811987249963446124e0_sp,&
     s60=r3*o2,                                                             &
     s64=.900968867902419126236102319507445051165919162131857150053562e0_sp,&
     s68=.923879532511286756128183189396788286822416625863642486115097e0_sp,&
     s70=.939692620785908384054109277324731469936208134264464633090286e0_sp,&
     s72=.951056516295153572116439333379382143405698634125750222447305e0_sp,&
     s75=.965925826289068286749743199728897367633904839008404550402343e0_sp,&
     s77=.974927912181823607018131682993931217232785800619997437648079e0_sp,&
     s79=.980785280403230449126182236134239036973933730893336095002916e0_sp,&
     s80=.984807753012208059366743024589523013670643251719842418790025e0_sp,&
! ... and their minuses:
     ms10=-s10,ms11=-s11,ms13=-s13,ms15=-s15,ms18=-s18,ms20=-s20,ms22=-s22,&
     ms26=-s26,ms30=-s30,ms34=-s34,ms36=-s36,ms39=-s39,ms40=-s40,ms45=-s45,&
     ms50=-s50,ms51=-s51,ms54=-s54,ms56=-s56,ms60=-s60,ms64=-s64,ms68=-s68,&
     ms70=-s70,ms72=-s72,ms75=-s75,ms77=-s77,ms79=-s79,ms80=-s80

complex(spc),parameter:: &
     c0=(u0,u0),c1=(u1,u0),mc1=-c1,ci=(u0,u1),mci=-ci,cipi=ci*pi,     &
! Main fractional rotations, as unimodualr complex numbers:
     z000=c1        ,z010=( s80,s10),z011=( s79,s11),z013=( s77,s13),&
     z015=( s75,s15),z018=( s72,s18),z020=( s70,s20),z022=( s68,s22),&
     z026=( s64,s26),z030=( s60,s30),z034=( s56,s34),z036=( s54,s36),&
     z039=( s51,s39),z040=( s50,s40),z045=( s45,s45),z050=( s40,s50),&
     z051=( s39,s51),z054=( s36,s54),z056=( s34,s56),z060=( s30,s60),&
     z064=( s26,s64),z068=( s22,s68),z070=( s20,s70),z072=( s18,s72),&
     z075=( s15,s75),z077=( s13,s77),z079=( s11,s79),z080=( s10,s80),&
     z090=ci,        z100=(ms10,s80),z101=(ms11,s79),z103=(ms13,s77),&
     z105=(ms15,s75),z108=(ms18,s72),z110=(ms20,s70),z112=(ms22,s68),&
     z116=(ms26,s64),z120=(ms30,s60),z124=(ms34,s56),z126=(ms36,s54),&
     z129=(ms39,s51),z130=(ms40,s50),z135=(ms45,s45),z140=(ms50,s40),&
     z141=(ms51,s39),z144=(ms54,s36),z146=(ms56,s34),z150=(ms60,s30),&
     z154=(ms64,s26),z158=(ms68,s22),z160=(ms70,s20),z162=(ms72,s18),&
     z165=(ms75,s15),z167=(ms77,s13),z169=(ms79,s11),z170=(ms80,s10),&
     z180=-z000,z190=-z010,z191=-z011,z193=-z013,z195=-z015,z198=-z018,&
     z200=-z020,z202=-z022,z206=-z026,z210=-z030,z214=-z034,z216=-z036,&
     z219=-z039,z220=-z040,z225=-z045,z230=-z050,z231=-z051,z234=-z054,&
     z236=-z056,z240=-z060,z244=-z064,z248=-z068,z250=-z070,z252=-z072,&
     z255=-z075,z257=-z077,z259=-z079,z260=-z080,z270=-z090,z280=-z100,&
     z281=-z101,z283=-z103,z285=-z105,z288=-z108,z290=-z110,z292=-z112,&
     z296=-z116,z300=-z120,z304=-z124,z306=-z126,z309=-z129,z310=-z130,&
     z315=-z135,z320=-z140,z321=-z141,z324=-z144,z326=-z146,z330=-z150,&
     z334=-z154,z338=-z158,z340=-z160,z342=-z162,z345=-z165,z347=-z167,&
     z349=-z169,z350=-z170
end module pietc_s
