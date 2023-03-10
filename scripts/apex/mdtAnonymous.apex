map<string, emailDomain__mdt> emails = EmailDomain__mdt.getAll();
system.debug(emails);

EmailDomain__mdt gmail = EmailDomain__mdt.getInstance('gmail');
system.debug('gmail ' + gmail);

//custom metadata types => custom object => we just retrieved it.

//custom metadata types records (data) is ALSO  metadata.