SoqlDemo.parentToChild_SOQL2();
SoqlDemo.parentToChild_SOQL1();
SoqlDemo.childToParent_SOQL1();
SoqlDemo.accountFilter_SOQL('GenePoint');
SoqlDemo.accountFilter_SOQL('sfdc');
SoqlDemo.accountFilter_SOQL('sForce');
SoqlDemo.accountSOQL_1();
SoqlDemo.accountSOQL_11();
SoqlDemo.accountSOQL_2();
SoqlDemo.accountSOQL_3();

 List<AggregateResult> x = [SELECT SUM(Amount), StageName FROM Opportunity GROUP BY StageName];
    system.debug(x);
    integer a = 0;
    for(AggregateResult ar: x){
    system.debug(ar.get('StageName') + '==> ' + ar.get('expr0'));
}
