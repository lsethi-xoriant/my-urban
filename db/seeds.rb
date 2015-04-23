=begin
vinnytska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	vinnytska_st.name = I18n.t 'state_name.vinnytska'
end
vinnytska_st.save

								vinnytsia = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									vinnytsia.en_name = I18n.t 'city.vinnytsia'
									vinnytsia.state_id = vinnytska_st.id
								end
								vinnytsia.save



volynska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	volynska_st.name = I18n.t 'state_name.volynska'
end
volynska_st.save

								lutsk = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									lutsk.en_name = I18n.t 'city.lutsk'
									lutsk.state_id = volynska_st.id
								end
								lutsk.save



dnipropetrovsk_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	dnipropetrovsk_st.name = I18n.t 'state_name.dnipropetrovsk'
end
dnipropetrovsk_st.save

								dnepropetrovsk = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									dnepropetrovsk.en_name = I18n.t 'city.dnepropetrovsk'
									dnepropetrovsk.state_id = dnipropetrovsk_st.id
								end
								dnepropetrovsk.save



donetsk_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	donetsk_st.name = I18n.t 'state_name.donetsk'
end
donetsk_st.save

								donetsk = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									donetsk.en_name = I18n.t 'city.donetsk'
									donetsk.state_id = donetsk_st.id
								end
								donetsk.save



zhytomyrska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	zhytomyrska_st.name = I18n.t 'state_name.zhytomyrska'
end
zhytomyrska_st.save

								zhytomyr = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									zhytomyr.en_name = I18n.t 'city.zhytomyr'
									zhytomyr.state_id = zhytomyrska_st.id
								end
								zhytomyr.save



zakarpatska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	zakarpatska_st.name = I18n.t 'state_name.zakarpatska'
end
zakarpatska_st.save

								uzhhorod = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									uzhhorod.en_name = I18n.t 'city.uzhhorod'
									uzhhorod.state_id = zhytomyrska_st.id
								end
								uzhhorod.save



zaporizka_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	zaporizka_st.name = I18n.t 'state_name.zaporizka'
end
zaporizka_st.save

								zaporizhia = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									zaporizhia.en_name = I18n.t 'city.zaporizhia'
									zaporizhia.state_id = zaporizka_st.id
								end
								zaporizhia.save



ivano_frankivska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	ivano_frankivska_st.name = I18n.t 'state_name.ivano_frankivska'
end
ivano_frankivska_st.save

								ivano_frankivsk = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									ivano_frankivsk.en_name = I18n.t 'city.ivano_frankivsk'
									ivano_frankivsk.state_id = ivano_frankivska_st.id
								end
								ivano_frankivsk.save



kyivska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	kyivska_st.name = I18n.t 'state_name.kyivska'
end
kyivska_st.save

								kyiv = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									kyiv.en_name = I18n.t 'city.kyiv'
									kyiv.state_id = kyivska_st.id
								end
								kyiv.save



kirovohradska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	kirovohradska_st.name = I18n.t 'state_name.kirovohradska'
end
kirovohradska_st.save

								kirovohrad = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									kirovohrad.en_name = I18n.t 'city.kirovohrad'
									kirovohrad.state_id = kirovohradska_st.id
								end
								kirovohrad.save



luhanska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	luhanska_st.name = I18n.t 'state_name.luhanska'
end
luhanska_st.save

								luhansk = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									luhansk.en_name = I18n.t 'city.luhansk'
									luhansk.state_id = luhanska_st.id
								end
								luhansk.save



lviv_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	lviv_st.name = I18n.t 'state_name.lviv'
end
lviv_st.save

								lviv = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									lviv.en_name = I18n.t 'city.lviv'
									lviv.state_id = lviv_st.id
								end
								lviv.save



mykolaivska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	mykolaivska_st.name = I18n.t 'state_name.mykolaivska'
end
mykolaivska_st.save

								mykolaiv = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									mykolaiv.en_name = I18n.t 'city.mykolaiv'
									mykolaiv.state_id = mykolaivska_st.id
								end
								mykolaiv.save



odessa_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	odessa_st.name = I18n.t 'state_name.odessa'
end
odessa_st.save

								odessa = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									odessa.en_name = I18n.t 'city.odessa'
									odessa.state_id = odessa_st.id
								end
								odessa.save



poltavska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	poltavska_st.name = I18n.t 'state_name.poltavska'
end
poltavska_st.save

								poltava = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									poltava.en_name = I18n.t 'city.poltava'
									poltava.state_id = poltavska_st.id
								end
								poltava.save



rivnenska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	rivnenska_st.name = I18n.t 'state_name.rivnenska'
end
rivnenska_st.save

								rivne = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									rivne.en_name = I18n.t 'city.rivne'
									rivne.state_id = rivnenska_st.id
								end
								rivne.save



sumska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	sumska_st.name = I18n.t 'state_name.sumska'
end
sumska_st.save

								sumy = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									sumy.en_name = I18n.t 'city.sumy'
									sumy.state_id = sumska_st.id
								end
								rivne.save



ternopilska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	ternopilska_st.name = I18n.t 'state_name.ternopilska'
end
ternopilska_st.save

								ternopil = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									ternopil.en_name = I18n.t 'city.ternopil'
									ternopil.state_id = ternopilska_st.id
								end
								ternopil.save



kharkiv_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	kharkiv_st.name = I18n.t 'state_name.kharkiv'
end
kharkiv_st.save

								kharkiv = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									kharkiv.en_name = I18n.t 'city.kharkiv'
									kharkiv.state_id = kharkiv_st.id
								end
								kharkiv.save



khersonska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	khersonska_st.name = I18n.t 'state_name.khersonska'
end
khersonska_st.save

								kherson = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									kherson.en_name = I18n.t 'city.kherson'
									kherson.state_id = khersonska_st.id
								end
								kherson.save



khmelnytska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	khmelnytska_st.name = I18n.t 'state_name.khmelnytska'
end
khmelnytska_st.save

								khmelnytskyi = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									khmelnytskyi.en_name = I18n.t 'city.khmelnytskyi'
									khmelnytskyi.state_id = khmelnytska_st.id
								end
								khmelnytskyi.save



cherkaska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	cherkaska_st.name = I18n.t 'state_name.cherkaska'
end
cherkaska_st.save

								cherkasy = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									cherkasy.en_name = I18n.t 'city.cherkasy'
									cherkasy.state_id = cherkaska_st.id
								end
								cherkasy.save



chernihivska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	chernihivska_st.name = I18n.t 'state_name.chernihivska'
end
chernihivska_st.save


								chernihiv = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									chernihiv.en_name = I18n.t 'city.chernihiv'
									chernihiv.state_id = chernihivska_st.id
								end
								chernihiv.save



chernivetska_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	chernivetska_st.name = I18n.t 'state_name.chernivetska'
end
chernivetska_st.save


								chernivtsi = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									chernivtsi.en_name = I18n.t 'city.chernivtsi'
									chernivtsi.state_id = chernivetska_st.id
								end
								chernivtsi.save



crimea_st = State.new
language = [:en, :uk, :ru]
language.each do |l|
	I18n.locale = l
	crimea_st.name = I18n.t 'state_name.crimea'
end
crimea_st.save


								simferopol = City.new
								language = [:en, :uk, :ru]
								language.each do |l|
									I18n.locale = l	
									simferopol.en_name = I18n.t 'city.simferopol'
									simferopol.state_id = crimea_st.id
								end
								simferopol.save
=end

	require 'securerandom'
	7.times do
		user = User.new
		user.email = "test@example#{SecureRandom.hex(3)}.com"
		user.urban = 'Івано-Франківськ'
		user.password = 'valid_password'
		user.password_confirmation = 'valid_password'
		user.first_name = 'new'
		user.last_name = 'new'
		user.gender = 'чоловіча'
		user.avatar_id = Avatar.last.id
		user.save!
		user.plans.create(measure_id: 8, status: 'come')
		user.friendships.create(:friend_id => 1, :status => 'friend')
	end
