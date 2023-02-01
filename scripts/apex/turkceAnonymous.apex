date dogumtarihi = date.newInstance(1996, 7, 7);
system.debug('Doğum tarihim --> ' + dogumtarihi);

integer birthday = dogumtarihi.day();
integer birthmonth = dogumtarihi.month();
integer birthyear = dogumtarihi.year();
integer birthMix = birthday + birthmonth + birthyear;
system.debug('Doğum günümün gün ay ve yıl toplamı --> ' + birthMix);
