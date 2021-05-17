!> @file
!> @brief Single precision constants
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
logical ,parameter:: T=.true. !< for pain-relief in logical ops
logical ,parameter:: F=.false. !< for pain-relief in logical ops
real(sp),parameter:: u0=0_sp !< zero
real(sp),parameter:: u1=1_sp !< one
real(sp),parameter:: mu1=-u1 !< minus-one
real(sp),parameter:: u2=2_sp !< two
real(sp),parameter:: mu2=-u2 !< minus-two
real(sp),parameter:: u3=3_sp !< three
real(sp),parameter:: mu3=-u3 !< minus-three
real(sp),parameter:: u4=4_sp !< four
real(sp),parameter:: mu4=-u4 !< minus-four
real(sp),parameter:: u5=5_sp !< five
real(sp),parameter:: mu5=-u5 !< minus-five
real(sp),parameter:: u6=6_sp !< six
real(sp),parameter:: mu6=-u6 !< minus-six
real(sp),parameter:: o2=u1/u2 !< half
real(sp),parameter:: o3=u1/u3 !< third
real(sp),parameter:: o4=u1/u4 !< fourth
real(sp),parameter:: o5=u1/u5 !< fifth
real(sp),parameter:: o6=u1/u6 !< sixth
real(sp),parameter:: mo2=-o2 !< minus-half
real(sp),parameter:: mo3=-o3 !< minus-third
real(sp),parameter:: mo4=-o4 !< minus-fourth
real(sp),parameter:: mo5=-o5 !< minus-fifth
real(sp),parameter:: mo6=-06 !< minus-sixth
real(sp),parameter:: pi =3.1415926535897932384626433832795028841971693993751058209749e0_sp !< pi
real(sp),parameter:: pi2=6.2831853071795864769252867665590057683943387987502116419498e0_sp !< pi*2
real(sp),parameter:: pih=1.5707963267948966192313216916397514420985846996875529104874e0_sp !< pi*half
real(sp),parameter:: rpi=1.7724538509055160272981674833411451827975494561223871282138e0_sp !< square root of pi
real(sp),parameter:: r2 =1.4142135623730950488016887242096980785696718753769480731766e0_sp !< Square root of 2.
real(sp),parameter:: r3 =1.7320508075688772935274463415058723669428052538103806280558e0_sp !< Square root of 3.
real(sp),parameter:: r5 =2.2360679774997896964091736687312762354406183596115257242708e0_sp !< Square root of 5.
real(sp),parameter:: or2=u1/r2 !< 1./root of two
real(sp),parameter:: or3=u1/r3 !< 1./root of three
real(sp),parameter:: or5=u1/r5 !< 1./root of five
real(sp),parameter:: phi=1.6180339887498948482045868343656381177203091798057628621354e0_sp !< Golden number.
real(sp),parameter:: euler=0.57721566490153286060651209008240243104215933593992359880e0_sp !< Euler-Mascheroni constant.
! Degree to radians; radians to degrees:
real(sp),parameter:: dtor=pi/180 !< Degrees to radians
real(sp),parameter:: rtod=180/pi !< radians to degrees
! Sines of all main fractions of 90 degrees (down to ninths):
real(sp),parameter:: s10=.173648177666930348851716626769314796000375677184069387236241e0_sp !< sine(10 deg)
real(sp),parameter:: s11=.195090322016128267848284868477022240927691617751954807754502e0_sp !< sine(90/8 deg)
real(sp),parameter:: s13=.222520933956314404288902564496794759466355568764544955311987e0_sp !< sine(90/7 deg)
real(sp),parameter:: s15=.258819045102520762348898837624048328349068901319930513814003e0_sp !< sine(15 deg)
real(sp),parameter:: s18=.309016994374947424102293417182819058860154589902881431067724e0_sp !< sine(18 deg)
real(sp),parameter:: s20=.342020143325668733044099614682259580763083367514160628465048e0_sp !< sine(20 deg)
real(sp),parameter:: s22=.382683432365089771728459984030398866761344562485627041433800e0_sp !< sine(22.5 deg)
real(sp),parameter:: s26=.433883739117558120475768332848358754609990727787459876444547e0_sp !< sine(90*2/7 deg)
real(sp),parameter:: s30=o2 !< sine(30 deg)
real(sp),parameter:: s34=.555570233019602224742830813948532874374937190754804045924153e0_sp !< sine(90*3/8 deg)
real(sp),parameter:: s36=.587785252292473129168705954639072768597652437643145991072272e0_sp !< sine(36 deg)
real(sp),parameter:: s39=.623489801858733530525004884004239810632274730896402105365549e0_sp !< sine(90*3/7 deg)
real(sp),parameter:: s40=.642787609686539326322643409907263432907559884205681790324977e0_sp !< sine(40 deg)
real(sp),parameter:: s45=or2 !< sine(45 deg)
real(sp),parameter:: s50=.766044443118978035202392650555416673935832457080395245854045e0_sp !< sine(50 deg)
real(sp),parameter:: s51=.781831482468029808708444526674057750232334518708687528980634e0_sp !< sine(90*4/7 deg)
real(sp),parameter:: s54=.809016994374947424102293417182819058860154589902881431067724e0_sp !< sine(54 deg)
real(sp),parameter:: s56=.831469612302545237078788377617905756738560811987249963446124e0_sp !< sine(90*5/8 deg)
real(sp),parameter:: s60=r3*o2 !< sine(60 deg)
real(sp),parameter:: s64=.900968867902419126236102319507445051165919162131857150053562e0_sp !< sine(90*5/7 deg)
real(sp),parameter:: s68=.923879532511286756128183189396788286822416625863642486115097e0_sp !< sine(67.5 deg)
real(sp),parameter:: s70=.939692620785908384054109277324731469936208134264464633090286e0_sp !< sine(70 deg)
real(sp),parameter:: s72=.951056516295153572116439333379382143405698634125750222447305e0_sp !< sine(72 deg)
real(sp),parameter:: s75=.965925826289068286749743199728897367633904839008404550402343e0_sp !< sine(75 deg)
real(sp),parameter:: s77=.974927912181823607018131682993931217232785800619997437648079e0_sp !< sine(90*6/7 deg)
real(sp),parameter:: s79=.980785280403230449126182236134239036973933730893336095002916e0_sp !< sine(90*7/8 deg)
real(sp),parameter:: s80=.984807753012208059366743024589523013670643251719842418790025e0_sp !< sine(80 deg)
!... and their minuses:
real(sp),parameter:: ms10=-s10 !< minus-sine(10 deg)
real(sp),parameter:: ms11=-s11 !< minus-sine(90/8 deg)
real(sp),parameter:: ms13=-s13 !< minus-sine(90/7 deg)
real(sp),parameter:: ms15=-s15 !< minus-sine(15 deg)
real(sp),parameter:: ms18=-s18 !< minus-sine(18 deg)
real(sp),parameter:: ms20=-s20 !< minus-sine(20 deg)
real(sp),parameter:: ms22=-s22 !< minus-sine(22.5 deg)
real(sp),parameter:: ms26=-s26 !< minus-sine(90*2/7 deg)
real(sp),parameter:: ms30=-s30 !< minus-sine(30 deg)
real(sp),parameter:: ms34=-s34 !< minus-sine(90*3/8 deg)
real(sp),parameter:: ms36=-s36 !< minus-sine(36 deg)
real(sp),parameter:: ms39=-s39 !< minus-sine(90*3/7 deg)
real(sp),parameter:: ms40=-s40 !< minus-sine(40 deg)
real(sp),parameter:: ms45=-s45 !< minus-sine(45 deg)
real(sp),parameter:: ms50=-s50 !< minus-sine(50 deg)
real(sp),parameter:: ms51=-s51 !< minus-sine(90*4/7 deg)
real(sp),parameter:: ms54=-s54 !< minus-sine(54 deg)
real(sp),parameter:: ms56=-s56 !< minus-sine(90*5/8 deg)
real(sp),parameter:: ms60=-s60 !< minus-sine(60 deg)
real(sp),parameter:: ms64=-s64 !< minus-sine(90*5/7 deg)
real(sp),parameter:: ms68=-s68 !< minus-sine(67.5 deg)
real(sp),parameter:: ms70=-s70 !< minus-sine(70 deg)
real(sp),parameter:: ms72=-s72 !< minus-sine(72 deg)
real(sp),parameter:: ms75=-s75 !< minus-sine(75 deg)
real(sp),parameter:: ms77=-s77 !< minus-sine(90*6/7 deg)
real(sp),parameter:: ms79=-s79 !< minus-sine(90*7/8 deg)
real(sp),parameter:: ms80=-s80 !< minus-sine(80 deg)

complex(spc),parameter::  c0=(u0,u0) !< complex zero
complex(spc),parameter::  c1=(u1,u0) !< complex one
complex(spc),parameter::  mc1=-c1 !< complex minus-one
complex(spc),parameter::  ci=(u0,u1) !< complex i=sqrt(-1)
complex(spc),parameter::  mci=-ci !< complex minus-i
complex(spc),parameter::  cipi=ci*pi !< complex i*pi
! Main fractional rotations, as unimodualr complex numbers:
complex(spc),parameter::  z000=c1 !< exp(2*pi*i*0)
complex(spc),parameter::  z010=( s80,s10) !< exp(2*pi*i/36)
complex(spc),parameter::  z011=( s79,s11) !< exp(2*pi*i/32)
complex(spc),parameter::  z013=( s77,s13) !< exp(2*pi*i/28)
complex(spc),parameter::  z015=( s75,s15) !< exp(2*pi*i/24)
complex(spc),parameter::  z018=( s72,s18) !< exp(2*pi*i/20)
complex(spc),parameter::  z020=( s70,s20) !< exp(2*pi*i/18)
complex(spc),parameter::  z022=( s68,s22) !< exp(2*pi*i/16)
complex(spc),parameter::  z026=( s64,s26) !< exp(2*pi*i/14)
complex(spc),parameter::  z030=( s60,s30) !< exp(2*pi*i/12)
complex(spc),parameter::  z034=( s56,s34) !< exp(2*pi*i*3/32)
complex(spc),parameter::  z036=( s54,s36) !< exp(2*pi*i/10)
complex(spc),parameter::  z039=( s51,s39) !< exp(2*pi*i*3/28)
complex(spc),parameter::  z040=( s50,s40) !< exp(2*pi*i/9)
complex(spc),parameter::  z045=( s45,s45) !< exp(2*pi*i/8)
complex(spc),parameter::  z050=( s40,s50) !< exp(2*pi*i*5/36)
complex(spc),parameter::  z051=( s39,s51) !< exp(2*pi*i/7)
complex(spc),parameter::  z054=( s36,s54) !< exp(2*pi*i*3/20)
complex(spc),parameter::  z056=( s34,s56) !< exp(2*pi*i*5/32)
complex(spc),parameter::  z060=( s30,s60) !< exp(2*pi*i/6)
complex(spc),parameter::  z064=( s26,s64) !< exp(2*pi*i*5/28)
complex(spc),parameter::  z068=( s22,s68) !< exp(2*pi*i*3/16)
complex(spc),parameter::  z070=( s20,s70) !< exp(2*pi*i*7/36)
complex(spc),parameter::  z072=( s18,s72) !< exp(2*pi*i/5)
complex(spc),parameter::  z075=( s15,s75) !< exp(2*pi*i*5/24)
complex(spc),parameter::  z077=( s13,s77) !< exp(2*pi*i*3/14)
complex(spc),parameter::  z079=( s11,s79) !< exp(2*pi*i*7/32)
complex(spc),parameter::  z080=( s10,s80) !< exp(2*pi*i*2/9)
complex(spc),parameter::  z090=ci !< exp(2*pi*i/4)
complex(spc),parameter::  z100=(ms10,s80) !< exp(2*pi*i*5/18)
complex(spc),parameter::  z101=(ms11,s79) !< exp(2*pi*i*9/32)
complex(spc),parameter::  z103=(ms13,s77) !< exp(2*pi*i*2/7)
complex(spc),parameter::  z105=(ms15,s75) !< exp(2*pi*i*7/24)
complex(spc),parameter::  z108=(ms18,s72) !< exp(2*pi*i*3/10)
complex(spc),parameter::  z110=(ms20,s70) !< exp(2*pi*i*11/36)
complex(spc),parameter::  z112=(ms22,s68) !< exp(2*pi*i*5/16)
complex(spc),parameter::  z116=(ms26,s64) !< exp(2*pi*i*9/28)
complex(spc),parameter::  z120=(ms30,s60) !< exp(2*pi*i/3)
complex(spc),parameter::  z124=(ms34,s56) !< exp(2*pi*i*11/32)
complex(spc),parameter::  z126=(ms36,s54) !< exp(2*pi*i*7/20)
complex(spc),parameter::  z129=(ms39,s51) !< exp(2*pi*i*5/14)
complex(spc),parameter::  z130=(ms40,s50) !< exp(2*pi*i*13/36)
complex(spc),parameter::  z135=(ms45,s45) !< exp(2*pi*i*3/8)
complex(spc),parameter::  z140=(ms50,s40) !< exp(2*pi*i*7/18)
complex(spc),parameter::  z141=(ms51,s39) !< exp(2*pi*i*11/28)
complex(spc),parameter::  z144=(ms54,s36) !< exp(2*pi*i*2/5)
complex(spc),parameter::  z146=(ms56,s34) !< exp(2*pi*i*13/32)
complex(spc),parameter::  z150=(ms60,s30) !< exp(2*pi*i*5/12)
complex(spc),parameter::  z154=(ms64,s26) !< exp(2*pi*i*3/7)
complex(spc),parameter::  z158=(ms68,s22) !< exp(2*pi*i*7/16)
complex(spc),parameter::  z160=(ms70,s20) !< exp(2*pi*i*4/9)
complex(spc),parameter::  z162=(ms72,s18) !< exp(2*pi*i*9/20)
complex(spc),parameter::  z165=(ms75,s15) !< exp(2*pi*i*11/24)
complex(spc),parameter::  z167=(ms77,s13) !< exp(2*pi*i*13/28)
complex(spc),parameter::  z169=(ms79,s11) !< exp(2*pi*i*15/32)
complex(spc),parameter::  z170=(ms80,s10) !< exp(2*pi*i*17/36)
complex(spc),parameter::  z180=-z000 !< exp(2*pi*i/2)
complex(spc),parameter::  z190=-z010 !< exp(2*pi*i*19/36)
complex(spc),parameter::  z191=-z011 !< exp(2*pi*i*17/32)
complex(spc),parameter::  z193=-z013 !< exp(2*pi*i*15/28)
complex(spc),parameter::  z195=-z015 !< exp(2*pi*i*13/24)
complex(spc),parameter::  z198=-z018 !< exp(2*pi*i*11/20)
complex(spc),parameter::  z200=-z020 !< exp(2*pi*i*5/9)
complex(spc),parameter::  z202=-z022 !< exp(2*pi*i*9/16)
complex(spc),parameter::  z206=-z026 !< exp(2*pi*i*4/7)
complex(spc),parameter::  z210=-z030 !< exp(2*pi*i*7/12)
complex(spc),parameter::  z214=-z034 !< exp(2*pi*i*19/32)
complex(spc),parameter::  z216=-z036 !< exp(2*pi*i*3/5)
complex(spc),parameter::  z219=-z039 !< exp(2*pi*i*17/28)
complex(spc),parameter::  z220=-z040 !< exp(2*pi*i*11/18)
complex(spc),parameter::  z225=-z045 !< exp(2*pi*i*5/8)
complex(spc),parameter::  z230=-z050 !< exp(2*pi*i*23/36)
complex(spc),parameter::  z231=-z051 !< exp(2*pi*i*9/14)
complex(spc),parameter::  z234=-z054 !< exp(2*pi*i*13/20)
complex(spc),parameter::  z236=-z056 !< exp(2*pi*i*21/32)
complex(spc),parameter::  z240=-z060 !< exp(2*pi*i*2/3)
complex(spc),parameter::  z244=-z064 !< exp(2*pi*i*19/28)
complex(spc),parameter::  z248=-z068 !< exp(2*pi*i*11/16)
complex(spc),parameter::  z250=-z070 !< exp(2*pi*i*25/36)
complex(spc),parameter::  z252=-z072 !< exp(2*pi*i*7/10)
complex(spc),parameter::  z255=-z075 !< exp(2*pi*i*17/24)
complex(spc),parameter::  z257=-z077 !< exp(2*pi*i*5/7)
complex(spc),parameter::  z259=-z079 !< exp(2*pi*i*23/32)
complex(spc),parameter::  z260=-z080 !< exp(2*pi*i*13/18)
complex(spc),parameter::  z270=-z090 !< exp(2*pi*i*3/4)
complex(spc),parameter::  z280=-z100 !< exp(2*pi*i*7/9)
complex(spc),parameter::  z281=-z101 !< exp(2*pi*i*25/32)
complex(spc),parameter::  z283=-z103 !< exp(2*pi*i*11/14)
complex(spc),parameter::  z285=-z105 !< exp(2*pi*i*19/24)
complex(spc),parameter::  z288=-z108 !< exp(2*pi*i*4/5)
complex(spc),parameter::  z290=-z110 !< exp(2*pi*i*29/36)
complex(spc),parameter::  z292=-z112 !< exp(2*pi*i*13/16)
complex(spc),parameter::  z296=-z116 !< exp(2*pi*i*23/28)
complex(spc),parameter::  z300=-z120 !< exp(2*pi*i*5/6)
complex(spc),parameter::  z304=-z124 !< exp(2*pi*i*27/32)
complex(spc),parameter::  z306=-z126 !< exp(2*pi*i*17/20)
complex(spc),parameter::  z309=-z129 !< exp(2*pi*i*6/7)
complex(spc),parameter::  z310=-z130 !< exp(2*pi*i*31/36)
complex(spc),parameter::  z315=-z135 !< exp(2*pi*i*7/8)
complex(spc),parameter::  z320=-z140 !< exp(2*pi*i*8/9)
complex(spc),parameter::  z321=-z141 !< exp(2*pi*i*25/28)
complex(spc),parameter::  z324=-z144 !< exp(2*pi*i*9/10)
complex(spc),parameter::  z326=-z146 !< exp(2*pi*i*29/32)
complex(spc),parameter::  z330=-z150 !< exp(2*pi*i*11/12)
complex(spc),parameter::  z334=-z154 !< exp(2*pi*i*13/14)
complex(spc),parameter::  z338=-z158 !< exp(2*pi*i*15/16)
complex(spc),parameter::  z340=-z160 !< exp(2*pi*i*17/18)
complex(spc),parameter::  z342=-z162 !< exp(2*pi*i*19/20)
complex(spc),parameter::  z345=-z165 !< exp(2*pi*i*23/24)
complex(spc),parameter::  z347=-z167 !< exp(2*pi*i*27/28)
complex(spc),parameter::  z349=-z169 !< exp(2*pi*i*31/32)
complex(spc),parameter::  z350=-z170 !< exp(2*pi*i*35/36)
end module pietc_s
