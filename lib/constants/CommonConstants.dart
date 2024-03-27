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

  static String tc = "Terms and Conditions\n"
      "\n\n1. Astrologers shall maintain a courteous, professional demeanor when interacting with customers and clients at all times. Respectful communication and conduct is expected in every interaction."
      "\n\n2. Delivering an exceptional level of customer satisfaction is the organization's top priority. Astrologers must strive to exceed client expectations through attentive service and prompt resolution of inquiries or issues."
      "\n\n3. Strict confidentiality must be observed regarding the company's internal policies, procedures, trade secrets, and proprietary information. Unauthorized disclosure of such information is grounds for disciplinary action."
      "\n\n4. Disclosure of any personal information pertaining to clients, callers, or other astrologers is strictly prohibited without explicit consent. Astrologers must comply with all data privacy laws and regulations."
      "\n\n5. Astrologers are prohibited from contacting clients or callers through unauthorized or personal channels of communication. All interactions must occur through approved, monitored company channels."
      "\n\n6. All conversations, calls, client information, and company data must be treated with the utmost confidentiality and in full compliance with relevant data privacy regulations and policies."
      "\n\n7. Astrologers shall refrain from making derogatory, defamatory, disparaging, or unsubstantiated remarks about the company, its personnel, services, or offerings in any public or private forum."
      "\n\n8. Non-compliance with any of the aforementioned terms and conditions by astrologers will result in immediate termination of their engagement with the company. The management reserves the sole right to take such disciplinary action without providing justification or explanation."
      "\n\n9. Intellectual property rights for all work products created by astrologers in the course of their duties shall be assigned to and owned by the company."
      "\n\n10. Astrologers are expected to abide by all applicable laws, regulations, and ethical standards relevant to their duties and scope of work."
      "\n\nBy accepting and adhering to these terms and conditions, astrologers acknowledge their understanding and agreement to uphold the company's strict standards of professionalism, confidentiality, ethical conduct, and commitment to superior client service.";
}