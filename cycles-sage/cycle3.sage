#################
#### Fields #####
#################

p=2^224-9035
Fp=GF(p)
Rp.<x>=Fp[]
Fp8.<nu> = Fp.extension(x^8-2,'x')

q=p^8-p^4+1
Fq=GF(q)
Rq.<x>=Fq[]
Fq2.<xi> = Fq.extension(x^2+13,'x')

#################
## Construct A ##
#################

alpha=nu+nu^2+nu^4 #nu^2=mu, nu^4=lambda 
A=EllipticCurve(Fp8,[0,0,0,0,alpha])
assert q*A.random_point() == A(0)

#################
## Construct B ##
#################

a=1174618248730824551994716857762782323678986549385794593038675517680925757830616784136713494748918648729314692550551723143975812173629981434231768602171390200915746184762434747927302510415402339839434327529083559098276816537875759657425613047177015184316415757382822696634529973426669418559054880555442605398955287918791941447556257770711595297456547492748974064429766657589301511806202663782693118602043165387042397407295000045355732252521221824649510480386548082602783641273663632925267701753530882252610333549055764317802302771937242825*xi + 174179599980304196842913598057430727813075127620292534725976853833971589586045016905325760983098925197831372112528832563104159489920515110996646039828605513310708122451641513850124551290082386597676610947366095902254973587250196200346432731886640852056269565917259813657487754619339009161827627954354476957436124361925387853965803779409233311258831356467293370928566661978752173194873432634775275083426513486401083811806006698321933696975916237434646489883878974124186669846341707022060849388859420302650907086554208274241303493548322629769
b=33727717840900389253110141263015712324711590282327652669969341739405021653233918397627329667867080162435271325538842901885780762188019837200499765290824796785151701682999115074756876551667691628110436008225393848626890890881748017018238819522728468115595373396904737541175673200872027289833542733051407745872007844658467835173166976247796996684583422043570724569968938576586296566482595033277284367862574145019807342154077200172913054980659306086089075071078623291554787695889825020503879280914753388981390516102625810281851923209877379324*xi +99502502807670897957850050430130027683567491124320048947996759840590235558597762285493251002937183384229632904007716859103926564071951355233535030302622271438882073125560109346894404872336688924608066595827152623174308794163137166151685936131973498784059236898735245463462835070703492130607731872920627034882595737432247787570956353373044728844883813180855325194289275842104428960538728463578683392300211656060940238088703161861884684051557507916690057765156396484135394595275979433213210911779887303214365468140543967050285997085274343930

B=EllipticCurve(Fq2,[0,0,0,a,b])
N= (p^4-1)^2*p^8
assert N*B.random_point() == B(0)
