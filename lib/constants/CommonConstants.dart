class CommonConstants {
  static String rupee = "₹";
  static String per = "%";
  static String id = "id";
  static String name = "name";
  static String mobile = "mobile";
  static String email = "email";
  static String dob = "dob";
  static String fcm = "fcm";
  static String status="status";
  static String user_id="user_id";
  static String astro_id="astro_id";
  static String essential="essential";
  static String seconds = "seconds";
  static List<String> reasons = ['Chat','Call','Rating Dispute','Payment Issues','Some Other Isuues'];

  static List<String> session_status = ['ALL', 'WAITLISTED', 'COMPLETED', 'ACTIVE', 'REQUESTED', 'RECONNECT','MISSED', 'REJECTED', 'CANCELLED'];


  static List<String> horoscope_day = ['Yesterday', 'Today', 'Tomorrow'];
  static List<String> zodiac_signs = ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'];
  static List<String> kundli = ['Basic', 'Charts', 'KP', 'Dasha'];
  static List<String> dasha = ['Vimshottari', 'Yogini'];
  static List<String> planet = ['Sign', 'Nakshatra'];

  static List<String> charts = ['Birth', 'Navamsa', 'Divisional'];
  static List<String> divCharts = [
    'Chalit', 'Sun', 'Moon', 'Hora', 'Drekkana', 'Chaturthamsa', 'Saptamsa', 'Dasamsa', 'Dwadasamsa', 'Shodasamsa',
    'Vimsamsa', 'Chaturvisamsa', 'Trimsamsa', 'Khavedamsa', 'Akshavedamsa', 'Shastiamsa'];

  static Map<String, Map<String, String>> chartDetails = {
    charts[0] : {'chart' : 'D1', 'name' : 'Birth'},
    charts[1] : {'chart' : 'D9', 'name' : 'Navamsad'},
    divCharts[0] : {'chart' : 'chalit', 'name' : 'Chalit'},
    divCharts[1] : {'chart' : 'SUN', 'name' : 'Sun'},
    divCharts[2] : {'chart' : 'MOON', 'name' : 'Moon'},
    divCharts[3] : {'chart' : 'D2', 'name' : 'Hora (D-2)'},
    divCharts[4] : {'chart' : 'D3', 'name' : 'Drekkana (D-3)'},
    divCharts[5] : {'chart' : 'D4', 'name' : 'Chaturthamsa (D-4)'},
    divCharts[6] : {'chart' : 'D7', 'name' : 'Saptamsa (D-7)'},
    divCharts[7] : {'chart' : 'D10', 'name' : 'Dasamsa (D-10)'},
    divCharts[8] : {'chart' : 'D12', 'name' : 'Dwadasamsa (D-12)'},
    divCharts[9] : {'chart' : 'D16', 'name' : 'Shodasamsa (D-16)'},
    divCharts[10] : {'chart' : 'D20', 'name' : 'Vimsamsa (D-20)'},
    divCharts[11] : {'chart' : 'D24', 'name' : 'Chaturvisamsa'},
    divCharts[12] : {'chart' : 'D30', 'name' : 'Trimsamsa'},
    divCharts[13] : {'chart' : 'D40', 'name' : 'Khavedamsa (D-40)'},
    divCharts[14] : {'chart' : 'D45', 'name' : 'Akshavedamsa (D-45)'},
    divCharts[15] : {'chart' : 'D60', 'name' : 'Shastiamsa (D-60)'},
  };


}