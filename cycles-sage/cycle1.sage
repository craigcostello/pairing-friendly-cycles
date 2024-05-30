
p=2^160-44159
Fp=GF(p)
Rp.<x>=Fp[]
Fp4.<mu> = Fp.extension(x^4-3,'x')
alpha=mu+mu^2 #mu^2=lambda 
A=EllipticCurve(Fp4,[0,0,0,0,alpha])
q=p^4-p^2+1
assert q*A.random_point() == A(0)

Fq=GF(q)
Rq.<x>=Fq[]
Fq2.<xi> = Fq.extension(x^2+5,'x')
a=4537724086617055572235495876079181392140169986500930378353690531135652904237014645617080473578409968567476115276746600760410398939001718841958317005830997642460357754099373316393605142383831229*xi +4017894427083366544794794183997243667271546612770742771527225788816592725178323719016475432804116904579829212050994833076180537751365928402301795194121295711443140391474988608347237416464806572
b=1418779656606931431334651269858256875417209244688252934860540331086850218553064747730616085141249369608157676691608613749121936592383949948712608513045827664827119414567526391545147674331539318*xi +34503808587321133658274936443870286463392297772111975345705507727610464870499873485718288499594666265197417342339059418398918685805439567756194530162469602769959348661021643033979504683686720

B=EllipticCurve(Fq2,[0,0,0,a,b])
N= (p^2-1)^2*p^4
assert N*B.random_point() == B(0)
