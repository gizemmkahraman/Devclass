ConditionClass_Assignment qr = new ConditionClass_Assignment();
string m1 = qr.Ifclassmethod(1);
system.debug('m1 is --> ' + m1);
string m12 = qr.Ifclassmethod(12);
system.debug('m12 is --> ' + m12);

ConditionClass_Assignment qr1 = new ConditionClass_Assignment();
string q1 = qr1.caseMethod('January');
system.debug('q1 is --> ' + q1);
string q12 = qr1.caseMethod('December');
system.debug('q12 is --> ' + q12);