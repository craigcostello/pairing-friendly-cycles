#################
#### Fields #####
#################

p=2^256-6539
Fp=GF(p)
Rp.<x>=Fp[]
Fp8.<nu> = Fp.extension(x^8-2,'x')

q=p^8-p^4+1
Fq=GF(q)
Rq.<x>=Fq[]
Fq2.<xi> = Fq.extension(x^2+11,'x')

#################
## Construct A ##
#################

alpha=nu+nu^4 #nu^4=lambda 
A=EllipticCurve(Fp8,[0,0,0,0,alpha])
assert q*A.random_point() == A(0)

#################
## Construct B ##
#################

a=3727647001551381287748678472894140418685879263996635026487061697822403249349229456512833881594589800656714170023789417349250882547349173413297547702433503213769816053684101703633309699499014163767281425394826689825705610833974953143694140466323798393013836525285100516643909620609347834060070824376431129884049136794569706126733226509347140870758061665897594787349754945982929909892538362537240605211203858602899272405449134141469948731206102289614421504398411160311974845656822271226556890442414069192225468466889416404454333979209973022924561098614148204275389511766888028764522908730962120590346805969038838344516*xi + 12132169243828664851087502360625230401543703076418434840172775400291513104571619553045388256686056335793594548735475487411516032597016500501756261480750724359682244551022502839565223088588033768189400667548812696436932709211861171995532748332685788305702701703751608309600274076766581028656487980509239802059243883857176772191043124697705966227518516407289192233136296095250054316292707177665826280245141524164092328029421578738140722012825365306150518144669342627670886168742748815315448403316419842416915169552698822037236021747364493952316041643352974464235581782185514049512118005744201249740462323245160966048416
b=31801403091928575138713207009406064328138100396077228115853752007898277445648645274262340680495689797807047181256385165284014321544467396684520916062543950668803924184770836092159394091546535929953172937662111441638944205937449543528394258740860867632847517178154485348273390553188000622329780358464040547419752801009726156138076152881694193592083303598896044314649823160191984180159265962689687011469087233088160244744306756812611777278292033891001112481017104314103874581058422640361677612879265675051961789723576850695596179040953696805217699785523964467397261054937245622517231224438867183542011578654162046842155*xi +7531844080979086516560951844920008683009893813750929055712170710457560414236058514595885740186638047089777540517740337302740629282906047965610336828396881632978195556470828846996789826054428704064896736492641664828191413439271774071335498843926558228381189164107845555437531870222508892344642661595401757144991380726631619107162587600993487873020358186911400181459552872140851923250963080499223849598192952249470328226922700238164204103682981194234484660153167106318979683391835650868974253505842093242791467856470659085535774115598009438078310099387461934041288801650201871488595522300060564662705187596168994062881

B=EllipticCurve(Fq2,[0,0,0,a,b])
N= (p^4-1)^2*p^8
assert N*B.random_point() == B(0)
