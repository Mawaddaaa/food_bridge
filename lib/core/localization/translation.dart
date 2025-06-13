import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      ...?languageTranslations["ar"],
      ...?onboardingTranslations["ar"],
      ...?loginTranslations["ar"],
      ...?forgetpasswordTranslations["ar"],
      ...?verifycodeTranslations["ar"],
      ...?resetpasswordTranslations["ar"],
      ...?registerTranslations["ar"],
      ...?successSignupTranslations["ar"],
      ...?successresetpasswordTranslations["ar"],
      ...?exitAlertTranslations["ar"],
      ...?termsTranslations["ar"],
      ...?donorHomeTranslations["ar"],
      ...?aboutUsTranslations["ar"],
      ...?donorSettingsTranslations["ar"],
      ...?profileTranslations["ar"],
      ...?receiverSettingsTranslations["ar"],
      ...?receiverHomeTranslations["ar"],
      ...?drawersTranslations["ar"],
      ...?detialsTranslations["ar"],
      ...?donorHomePageTranslations["ar"],
      ...?editItemsTranslations["ar"],
      ...?addItemsTranslations["ar"],
      ...?chatsTranslations["ar"],
      ...?notificationsTranslations["ar"],
      ...?goalsTranslations["ar"],
      ...?recHomePageTranslations["ar"],
      ...?adminTranslations["ar"],
      ...?filterTranslations["ar"],
      ...?archiveTranslations["ar"],
      ...?ratingTranslations["ar"],
      ...?recdetailsTranslations["ar"],
      ...?orddetailsTranslations["ar"],
      ...?RecSearchTranslations["ar"],
      ...?AddressesTranslations["ar"],
      ...?ValidationTranslations["ar"],
      ...?cartTranslations["ar"],
    },
    "en": {
      ...?languageTranslations["en"],
      ...?onboardingTranslations["en"],
      ...?loginTranslations["en"],
      ...?forgetpasswordTranslations["en"],
      ...?verifycodeTranslations["en"],
      ...?resetpasswordTranslations["en"],
      ...?registerTranslations["en"],
      ...?successSignupTranslations["en"],
      ...?successresetpasswordTranslations["en"],
      ...?exitAlertTranslations["en"],
      ...?termsTranslations["en"],
      ...?donorHomeTranslations["en"],
      ...?aboutUsTranslations["en"],
      ...?donorSettingsTranslations["en"],
      ...?profileTranslations["en"],
      ...?receiverSettingsTranslations["en"],
      ...?receiverHomeTranslations["en"],
      ...?drawersTranslations["en"],
      ...?detialsTranslations["en"],
      ...?donorHomePageTranslations["en"],
      ...?editItemsTranslations["en"],
      ...?addItemsTranslations["en"],
      ...?chatsTranslations["en"],
      ...?notificationsTranslations["en"],
      ...?goalsTranslations["en"],
      ...?recHomePageTranslations["en"],
      ...?adminTranslations["en"],
      ...?filterTranslations["en"],
      ...?archiveTranslations["en"],
      ...?ratingTranslations["en"],
      ...?recdetailsTranslations["en"],
      ...?orddetailsTranslations["en"],
      ...?RecSearchTranslations["en"],
      ...?AddressesTranslations["en"],
      ...?ValidationTranslations["en"],
      ...?cartTranslations["en"],
    },
  };

  static final Map<String, Map<String, String>> languageTranslations = {
    "ar": {
      "text": "اختر اللغة",
      "langButton1": "العربية",
      "langButton2": "الانجليزية",
    },
    "en": {
      "text": "Choose Language",
      "langButton1": "Arabic",
      "langButton2": "English",
    },
  };

  static final Map<String, Map<String, String>> onboardingTranslations = {
    "ar": {
      "title1": "مرحبًا بك في Food Bridge!",
      "subtitle1": "انضم إلينا للحد من هدر الطعام \n وإحداث فرق في مجتمعك.",
      "button1": "ابدأ الآن",
      "skipText": "تخطي",
      "title2": "شارك فائضك",
      "subtitle2": "تبرع بسهولة بالطعام الفائض من \n مطعمك أو منزلك للمحتاجين.",
      "button2": "التالي",
      "title3": "ابحث عن مساعدة قريبة",
      "subtitle3": "تواصل مع الجمعيات الخيرية المحلية \n والأفراد الذين يبحثون عن مساعدة غذائية.",
      "button3": "إنهاء",
    },
    "en": {
      "title1": "Welcome to Food Bridge!",
      "subtitle1": "Join us in reducing food waste and \n making a difference in your community.",
      "button1": "Get Started",
      "skipText": "Skip",
      "title2": "Share Your Surplus",
      "subtitle2": "Easily donate excess food from your \n restaurant or home to those in need.",
      "button2": "Next",
      "title3": "Find Nearby Help",
      "subtitle3": "Connect with local charities and \n individuals looking for food assistance.",
      "button3": "Finish",
    },
  };

  static final Map<String, Map<String, String>> loginTranslations = {
    "ar": {
      "loginTitle": "سجل الدخول هنا",
      "loginSubTitle": "مرحبًا بعودتك،نفتقدك!",
      "loginFormField1": "البريد الإلكتروني",
      "loginFormField2": "كلمة المرور",
      "ForgotPasswordText": "هل نسيت كلمة المرور؟",
      "loginButton1": "تسجيل الدخول",
      "createNewAccountText": "إنشاء حساب جديد",
      "continueWithText": "أو تابع باستخدام",
      "donthaveanaccount" : "ليس لديك حساب ؟",
      "EmailOrPasswordNotCorrect" : "البريد الإلكتروني أو كلمة المرور غير صحيحة"
    },
    "en": {
      "loginTitle": "Login here",
      "loginSubTitle": "Welcome back you’ve been missed!",
      "loginFormField1": "Email",
      "loginFormField2": "Password",
      "ForgotPasswordText": "Forget your password?",
      "loginButton1": "Sign in",
      "createNewAccountText": "Create new account",
      "continueWithText": "Or continue with",
      "donthaveanaccount" : "Don't have an account ?",
      "EmailOrPasswordNotCorrect" : "Email Or Password Not Correct"
    },
  };

  static final Map<String, Map<String, String>> forgetpasswordTranslations = {
    "ar": {
      "forgetTitle": "هل نسيت كلمة المرور",
      "forgetbody":"قم بإستعادة كلمة المرور الخاصة بك إذا نسيتها!",
      "forgetbutton":"إرسال",
      "EmailNotFound" : "البريد الالكترونى غير موجود"
    },
    "en": {
      "forgetTitle": "Forget Password?",
      "forgetbody":"Recover your password if you \n have forget it!",
      "forgetbutton":"Submit",
      "EmailNotFound" : "Email Not Found"
      
    },
  };

  static final Map<String, Map<String, String>> verifycodeTranslations = {
    "ar": {
      "verifyCodeTitle": "كود التحقق",
      "verifyCodebody":"لقد أرسلنا بريدًا إلكترونيًا إلي حساب بريدك الإلكتروني يحتوي على رمز التحقق!",
      "Resendverifycode" : "اعادة ارسال رمز التحقق!",
      "Warning": "تحذير",
      "VerifyCodeNotCorrect" : "رمز التحقق ليس صحيحا"
    },
    "en": {
      "verifyCodeTitle": "Verification Code",
      "verifyCodebody":"We have sent an email to your email \n account with a verification code!",
      "Resendverifycode" : "Resend verification code!",
      "Warning": "Warning",
      "VerifyCodeNotCorrect" : "Verify Code Not Correct"
      
    },
  };

  static final Map<String, Map<String, String>> resetpasswordTranslations = {
    "ar": {
      "ResetPasswordTitle": "إعادة تعيين كلمة المرور",
      "ResetPasswordbody":"قم بتعيين كلمة المرور الجديدة لتسجيل الدخول إلي حسابك!",
      "ResetPasswordFormField1":"كلمة مرور جديدة",
      "ResetPasswordFormField2":"تأكيد كلمة المرور",
      "PasswordNotMatch" : "كلمة المرور ليست متطابقة",
      "TryAgain" : "أعد المحاولة مرة اخري"
    },
    "en": {
      "ResetPasswordTitle": "Reset Password",
      "ResetPasswordbody":"Set your new password to login into \n your account!",
      "ResetPasswordFormField1":"New Password",
      "ResetPasswordFormField2":"Confirm Password",
      "PasswordNotMatch" : "Password Not Match",
      "TryAgain" : "Try Again"
      
    },
  };

  static final Map<String, Map<String, String>> successresetpasswordTranslations = {
    "ar": {
      "SuccessResetPasswordTitle": "تم إعادة تعيين كلمة المرور بنجاح!",
      "SuccessResetPasswordBody": "الآن يمكنك تسجيل الدخول باستخدام كلمة المرور الجديدة والاستمرار في استخدام Food Bridge دون أي انقطاعات!",
      "SuccessResetPasswordButton": "العودة لتسجيل الدخول",
    },
    "en": {
      "SuccessResetPasswordTitle": "Password Reset Successfully!",
      "SuccessResetPasswordBody":"Now you can log in with your new password and continue using Food Bridge without any interruptions!",
      "SuccessResetPasswordButton":"back to login",
    },
  };

  static final Map<String, Map<String, String>> registerTranslations = {
    "ar": {
      "RegisterTitle": "إنشاء حساب",
      "RegisterBody": "قم بإنشاء حساب للوصول إلى جميع \n ميزات Food Bridge!",
      "RegisterFormField1": "الاسم",
      "RegisterFormField2": "البريد الإلكتروني",
      "RegisterFormField3": "كلمة المرور",
      "RegisterFormField4": "رقم الهاتف",
      "RegisterRoleQuestion": "من أنت؟",
      "ButtonRole1": "متبرع",
      "ButtonRole2": "مستفيد",
      "RegisterNameValidate": "اسم المستخدم غير صالح",
      "RegisterEmailValidate": "البريد الإلكتروني غير صالح",
      "RegisterPhoneValidate": "رقم الهاتف غير صالح",
      "RegisterEmptyValidate": "لا يمكن أن يكون فارغًا",
      "RegisterLimitValidateMin": " لا يمكن أن تكون أقل من {min}",
      "RegisterLimitValidateMax": "لا يمكن أن تكون أكبر من {max}",
      "RegisterTermsAuth": "أوافق على الشروط والأحكام",
      "RegisterSignupButton": "التسجيل",
      "RegisterToLogin": "هل لديك حساب بالفعل؟",
      "AlreadyExists" :"البريد الالكتروني او رقم الهتف موجودا بالفعل"
    },
    "en": {
      "RegisterTitle": "Create Account",
      "RegisterBody":"Create an account to access all the \n features of Food Bridge!",
      "RegisterFormField1":"Name",
      "RegisterFormField2":"Email",
      "RegisterFormField3":"password",
      "RegisterFormField4":"Phone Number",
      "RegisterRoleQuestion":"Who are you ?",
      "ButtonRole1":"Donor",
      "ButtonRole2":"Recipient",
      "RegisterNameValidate":"not valid username",
      "RegisterEmailValidate":"not valid email",
      "RegisterPhoneValidate":"not valid phone",
      "RegisterEmptyValidate":"can't be empty",
      "RegisterLimitValidateMin": "can't be less than {min}",
      "RegisterLimitValidateMax": "can't be larger than {max}",
      "RegisterTermsAuth": "I agree to the terms and conditions",
      "RegisterSignupButton": "Sign Up",
      "RegisterToLogin": "Already have an account",
      "AlreadyExists" :"Email Or Phone Number Already Exists"
    },
  };

  static final Map<String, Map<String, String>> successSignupTranslations = {
    "ar": {
    "SuccessSignupTitle": "تم إنشاء الحساب بنجاح!",
    "SuccessSignupBody": "الآن يمكنك تسجيل الدخول والبدء في التواصل مع المتبرعين والمستفيدين لمشاركة واستقبال الطعام بسهولة!",
    "SuccessSignupButton": "العودة لتسجيل الدخول",
    },
    "en": {
      "SuccessSignupTitle": "Account Created Successfully!",
      "SuccessSignupBody":"Now you can log in and start connecting with donors and recipients to share and receive food effortlessly!",
      "SuccessSignupButton":"back to login",
    },
  };

  static final Map<String, Map<String, String>> exitAlertTranslations = {
    "ar": {
      "ExitAlertTitle": "تنبيه",
      "ExitAlertQuestion": "هل أنت متأكد من الخروج من التطبيق؟",
      "ExitAlertQuestionDelete": "هل أنت متأكد من الحذف؟",
      "ExitAlertButton1": "تأكيد",
      "ExitAlertButton2": "إلغاء",
    },
    "en": {
      "ExitAlertTitle": "Alert",
      "ExitAlertQuestion":"Are you Sure to exit the app?",
      "ExitAlertQuestionDelete":"Are you sure to delete ?",
      "ExitAlertButton1":"Confirm",
      "ExitAlertButton2":"Cancel",
    },
  };

  static final Map<String, Map<String, String>> termsTranslations = {
    "ar": {
      "IAgreeTo": "أوافق على ",
      "TermsAndConditions": "الشروط وسياسة الخصوصية",
      "TermsAndConditionsTitle": "الشروط والأحكام",
      "ShouldAgreeAlert" : "يجب الموافقة على الشروط والأحكام",
      "TermsDetails": """
باستخدام تطبيق Food Bridge، فإنك توافق على الالتزام بالشروط التالية:
✔ مسؤوليات المتبرعين
- التأكد من سلامة الطعام قبل التبرع
- تحديد الكميات بدقة
- تحديث حالة الطعام فورًا

✔ مسؤوليات المستلمين
- استلام الطعام في الوقت المحدد
- استخدام الطعام للأغراض المخصصة فقط
- عدم إعادة بيع العناصر المتبرع بها

✔ سلامة الطعام
- التطبيق غير مسؤول عن تلف الطعام بعد التبرع
- يتحمل المستخدمون المسؤولية الكاملة عن جودة الطعام

✔ الحسابات
- يحق للتطبيق تعليق الحسابات المخالفة
- تقديم معلومات دقيقة عند التسجيل

✔ المحتوى
- يحظر نشر محتوى مسيء أو غير قانوني
- يحق للإدارة حذف أي محتوى مخالف

✔ التعديلات
- قد يتم تحديث الشروط دون إشعار مسبق
- الاستمرار في الاستخدام يعني القبول بالتحديثات

✔ الملكية الفكرية
- جميع الحقوق محفوظة للمطورين
- يحظر النسخ أو التعديل

✔ الإبلاغ عن المشكلات
- الإبلاغ الفوري عن العناصر الفاسدة
- معالجة البلاغات خلال 24 ساعة

✔ القانون الحاكم
- تخضع هذه الشروط لقوانين جمهورية مصر العربية
""",

      "PrivacyPolicyTitle": "سياسة الخصوصية",
      "PrivacyDetails": """
✔ البيانات المجمعة
- الموقع الجغرافي لمطابقة التبرعات
- معلومات الاتصال الأساسية
- سجل التبرعات والطلبات

✔ استخدام البيانات
- تحسين تجربة المستخدم
- إرسال تنبيهات بالتبرعات القريبة
- إنشاء تقارير إحصائية

✔ الحماية
- تشفير بيانات النقل
- تخزين آمن على السحابة
- تحديثات أمنية دورية

✔ المشاركة
- عدم مشاركة البيانات مع أطراف ثالثة
- استثناء لطلبات الجهات الحكومية

✔ حقوق المستخدم
- طلب نسخة من البيانات
- طلب حذف الحساب
- تحديث المعلومات الشخصية

✔ الكوكيز
- كوكيز تحليل الاستخدام
- يمكن تعطيلها من إعدادات المتصفح

✔ الأطفال
- غير مصمم لمن هم دون 13 عامًا
- حذف حسابات القصر المكتشفة

✔ التواصل
- قنوات دعم متاحة 24/7
- ردود خلال 6 ساعات عمل

✔ التحديثات
- إشعار مسبق قبل تغيير السياسة
- تتطلب الموافقة مجددًا

✔ الاتصال
- تواصل مع الدعم للاستفسارات
- السياسة جزء لا يتجزأ من الشروط

تم التحديث: 20 فبراير 2024
""",
      "AcceptContinue": "موافق ومتابعة"
    },
    "en": {
      "IAgreeTo": "I agree to the ",
      "TermsAndConditions": "Terms & Privacy Policy",
      "TermsAndConditionsTitle" : "Terms & Conditions",
      "ShouldAgreeAlert" : "You must accept the terms and conditions",
      "TermsDetails": """
By using Food Bridge, you agree to be bound by these Terms :
✔ Donor Responsibilities
- Ensure food safety before donation
- Accurately specify quantities
- Update food status promptly
✔ Recipient Responsibilities
- Collect food on time
- Use food for intended purposes only
- No resale of donated items
✔ Food Safety
- App not liable for post-donation spoilage
- Users bear full responsibility for food quality
✔ Accounts
- App reserves right to suspend violating accounts
- Accurate information required at registration
✔ Content
- Prohibited to post offensive/illegal content
- Management may delete violating content
✔ Modifications
- Terms may be updated without prior notice
- Continued use implies acceptance
✔ Intellectual Property
- All copyrights reserved to developers
- No copying/modification allowed
✔ Issue Reporting
- Immediate reporting of spoiled items
- Reports handled within 24 hours
✔ Governing Law
- Subject to Egyptian law
""",
      "PrivacyPolicyTitle" : "Privacy Policy",
      "PrivacyDetails": """
✔ Collected Data
- Geolocation for donation matching
- Basic contact information
- Donation/request history
✔ Data Usage
- Improve user experience
- Send nearby donation alerts
- Generate statistical reports
✔ Protection
- Transport layer encryption
- Secure cloud storage
- Regular security updates
✔ Sharing
- No third-party sharing
- Exception for government requests
✔ User Rights
- Request data copy
- Request account deletion
- Update personal info
✔ Cookies
- Usage analysis cookies
- Disable via browser settings
✔ Children
- Not designed for under 13
- Delete discovered minor accounts
✔ Communication
- 24/7 support channels
- Responses within 6 working hours
✔ Updates
- Prior notice before policy changes
- Re-approval required
✔ Contact
- Contact support for inquiries
- Policy integral part of Terms

Last Updated: 2024-02-20
""",
      "AcceptContinue": "Accept & Continue"
    }
  };


  static final Map<String, Map<String, String>> donorHomeTranslations = {
    "ar": {
      "BottomItem1": "الرئيسية",
      "BottomItem2":"الاهداف",
      "BottomItem3":"الرسائل",
      "BottomItem4":"الاعدادات",
    },
    "en": {
      "BottomItem1": "Home",
      "BottomItem2":"Goals",
      "BottomItem3":"Chats",
      "BottomItem4":"Settings",
    },
  };

  static final Map<String, Map<String, String>> aboutUsTranslations = {
    "ar": {
      "AppBarTitle": "نبذة عنا",
      "AboutUsTitle": "عن Food Bridge",
      "AboutUsSubtitle": "منصة مجانية لإعادة توزيع الطعام",
      "Passage1": "في Food Bridge، نؤمن أنه لا يجب أن يجوع أحد بينما يُهدر الطعام الجيد. مهمتنا بسيطة لكنها قوية: ردم الفجوة بين الطعام الفائض والأشخاص الذين في حاجة إليه.",
      "Passage2": "Food Bridge هي منصة مبتكرة تربط المتبرعين بالطعام - مثل المطاعم، المقاهي، محلات البقالة، ومنظمي الفعاليات - بالأفراد، الجمعيات، والمنظمات التي يمكنها توزيع الطعام لأولئك الذين هم في أمس الحاجة إليه.",
      "Passage3": "من خلال الاستفادة من التكنولوجيا، نسهل على المتبرعين مشاركة الطعام الفائض وعلى المستفيدين الوصول إلى وجبات غذائية مغذية، بينما نساعد في تقليل هدر الطعام وتعزيز روح المجتمع.",
      "Passage4": "رؤيتنا هي خلق عالم حيث يتم مشاركة الطعام بدلاً من هدره، وحيث يمكن للجميع الحصول على الوجبات التي يحتاجون إليها.",
      "Passage5": "سواء كنت متبرعاً يسعى لإحداث فرق أو شخصاً يبحث عن الدعم، فإن Food Bridge هنا للمساعدة. معاً، يمكننا مكافحة الجوع، تقليل النفايات، وبناء مستقبل أكثر استدامة.",
      "Passage6": "انضم إلينا في رحلتنا لإطعام المجتمعات، وجبة تلو الأخرى."
    },

    "en": {
      "AppBarTitle": "About",
      "AboutUsTitle": "About Food Bridge",
      "AboutUsSubtitle": "Free Food Redistribution Platform",
      "Passage1": "At Food Bridge, we believe that no one should go hungry while good food goes to waste. Our mission is simple yet powerful: to bridge the gap between surplus food and those in need.",
      "Passage2" : "Food Bridge is an innovative platform that connects food donors—such as restaurants, cafes, grocery stores, and event organizers—with individuals, charities, and organizations that can distribute food to those who need it most.",
      "Passage3" : "By leveraging technology, we make it easy for donors to share excess food and for recipients to access nutritious meals, all while reducing food waste and fostering a sense of community.",
      "Passage4" : "Our vision is to create a world where food is shared, not wasted, and where everyone has access to the meals they need.",
      "Passage5" : "Whether you’re a donor looking to make a difference or someone seeking support, Food Bridge is here to help. Together, we can fight hunger, reduce waste, and build a more sustainable future.",
      "Passage6" : "Join us in our journey to nourish communities, one meal at a time.",

    },
  };

  static final Map<String, Map<String, String>> donorSettingsTranslations = {
    "ar": {
      "Item1": "الملف الشخصي",
      "Item2": "العنوان",
      "Item3": "اللغة",
      "Item4": "نبذة عنا",
      "Item5": "تواصل معنا",
      "Item6": "تسجيل الخروج",
      "contactusubject": "كيف يمكننا مساعدتك؟!"
    },

    "en": {
      "Item1": "profile",
      "Item2": "address",
      "Item3": "Language",
      "Item4": "About Us",
      "Item5": "Contact Us",
      "Item6": "LogOut",
      "contactusubject": "How we can help you?!"

    },
  };

  static final Map<String, Map<String, String>> receiverSettingsTranslations = {
    "ar": {
      "RecItem1": "الملف الشخصي",
      "RecItem2": "اللغة",
      "RecItem3": "الطلبات",
      "RecItem4": "الأرشيف",
      "RecItem5": "نبذة عنا",
      "RecItem6": "تواصل معنا",
      "RecItem7": "تسجيل الخروج"
    },

    "en": {
      "RecItem1": "profile",
      "RecItem2": "Language",
      "RecItem3": "Orders",
      "RecItem4": "Archive",
      "RecItem5": "About Us",
      "RecItem6": "Contact Us",
      "RecItem7": "LogOut",

    },
  };

  static final Map<String, Map<String, String>> profileTranslations = {
    "ar": {
      "profileTitle": "الملف الشخصي",
      "profileTextForm1": "أدخل اسمك",
      "profileTextForm2": "أدخل رقم هاتفك",
      "profilebutton": "حفظ التغييرات",
      "Profileupdated": "تم تحديث الملف الشخصي بنجاح",
      "Profileupdatedfail": "فشل تحديث الملف الشخصي",
      "Invalidserverresponse": "تنسيق استجابة الخادم غير صالح",
    },

    "en": {
      "profileTitle": "Profile",
      "profileTextForm1": "Enter your name",
      "profileTextForm2": "Enter your phone number",
      "profilebutton": "Save Changes",
      "Profileupdated": "Profile updated successfully",
      "Profileupdatedfail": "Failed to update profile",
      "Invalidserverresponse": "Invalid server response format",

    },
  };

  static final Map<String, Map<String, String>> receiverHomeTranslations = {
    "ar": {
      "RecBottomItem1": "الرئيسية",
      "RecBottomItem2": "الحجوزات",
      "RecBottomItem3": "الرسائل",
      "RecBottomItem4": "الإعدادات",
      "RecBodyTitle": "قوائم الطعام:",
      "RecBodybuttonlist":"حجز",
    },
    "en": {
      "RecBottomItem1": "Home",
      "RecBottomItem2":"Reservations",
      "RecBottomItem3":"Chats",
      "RecBottomItem4":"Settings",
      "RecBodyTitle":"Food Lists :",
      "RecBodybuttonlist":"Reserve",
    },
  };

  static final Map<String, Map<String, String>> drawersTranslations = {
    "ar": {
      "DrawerHome": "الرئيسية",
      "DrawerGoals": "الأهداف",
      "DrawerChats": "الرسائل",
      "DrawerSettings": "الإعدادات",
      "DrawerProfile": "الملف الشخصي",
      "DrawerAbout": "حول التطبيق",
      "DrawerLogout": "تسجيل الخروج",
      "DrawerReservations": "الحجوزات",
      "DrawerOrders": "الطلبات",
      "DrawerArchive": "الأرشيف",
      "DrawerRequests": "الطلبات الواردة"
    },
    "en": {
      "DrawerHome": "Home",
      "DrawerGoals":"Goals",
      "DrawerChats":"Chats",
      "DrawerSettings":"Settings",
      "DrawerProfile":"Profile",
      "DrawerAbout":"About",
      "DrawerLogout":"Logout",
      "DrawerReservations":"Reservations",
      "DrawerOrders":"Orders",
      "DrawerArchive":"Archive",
      "DrawerRequests":"Requests",
    },
  };

  static final Map<String, Map<String, String>> detialsTranslations = {
    "ar": {
      "DetailsAppBarTitle": "تفاصيل الطعام",
      "DetailsButtonDelete": "حذف",
      "Type": "النوع",
      "Quantity": "الكمية",
      "ExpiredDate": "تاريخ الانتهاء",
      "Edit": "تعديل",
      "Address": "العنوان",
      "GOcart": "الذهاب إلي السلة",
      "TimeRemaining": "الوقت المتبقي",
      "Expired": "منتهي الصلاحية",
      "Days": "أيام",
      "Hours": "ساعات",
      "Minutes": "دقيقة",
      "NoAddressAdded": "لم تتم إضافة أي عنوان",
      "addaddresstocontinue": "الرجاء إضافة عنوان للمتابعة",
      "Taptoadd": "انقر هنا للإضافة",
    },
    "en": {
      "DetailsAppBarTitle": "Food Details",
      "DetailsButtonDelete":"Delete",
      "Type":"Type",
      "Quantity":"Quantity",
      "ExpiredDate":"Expired Date",
      "Edit":"Edit",
      "Address": "Address",
      "GOcart": "Go to Cart",
      "TimeRemaining": "Time Remaining",
      "Expired": "Expired",
      "Days": "Days",
      "Hours": "Hours",
      "Minutes": "Minutes",
      "NoAddressAdded": "No Address Added",
      "addaddresstocontinue": "Please add an address to continue",
      "Taptoadd": "Tap here to add",
    },
  };

  static final Map<String, Map<String, String>> donorHomePageTranslations = {
    "ar": {
      "DonorHomePageTitle": "قوائم الطعام الخاصة بك:",
      "DetailsNoFood": "لا توجد عناصر طعام",
      "DetailsTitle": "العنوان: @name",
      "DetailsType": "النوع: @type",
      "DetailsDescription": "الوصف: @description",
      "DetailsQuantity": "الكمية: @quantity",
      "DetailsExpireDate": "تاريخ الانتهاء: @date"
    },
    "en": {
      "DonorHomePageTitle": "Your Food Lists : ",
      "DetailsNoFood":"No food items found",
      "DetailsTitle": "Title: @name",
      "DetailsType": "Type: @type",
      "DetailsDescription": "Description: @description",
      "DetailsQuantity": "Quantity: @quantity",
      "DetailsExpireDate": "Expire date: @date"
    },
  };

  static final Map<String, Map<String, String>> editItemsTranslations = {
    "ar": {
      "EditItemTitle": "تعديل الطعام",
      "EditItemPhotos": "صور الطعام (الحد الأقصى 10)",
      "EditItemChooseFromGallery": "اختر من المعرض",
      "TakeaPhoto": "التقط صورة",
      "AddPhotosCount": "أضف صورًا (@count/10)",
      "Foodtype": "نوع الطعام",
      "Description": "الوصف",
      "SelectDate": "اختر التاريخ",
      "Update": "تحديث",
      "Title": "العنوان",
      "Other": "اخر",
      "QuantityValid": "ادخل الكمية",
      "NumberValid": "ادخل رقم صالح",
      "NumberValidmin": "يجب ان تكون الكمية اكبر من صفر",
    },
    "en": {
      "EditItemTitle": "Edit Food Item",
      "EditItemPhotos":"Food Photos (Max 10)",
      "EditItemChooseFromGallery": "Choose from Gallery",
      "TakeaPhoto": "Take a Photo",
      "AddPhotosCount": "Add Photos (@count/10)",
      "Foodtype": "Food Type",
      "Description": "Description",
      "SelectDate": "Select Date",
      "Update": "Update",
      "Title": "Title",
      "Other": "Other",
      "QuantityValid": "Please enter a quantity",
      "NumberValid": "Please enter a valid number",
      "NumberValidmin": "Quantity must be greater than 0",
    },
  };

  static final Map<String, Map<String, String>> addItemsTranslations = {
    "ar": {
      "addItemTitle": "التبرع بالطعام",
      "addItemPhotos": "صور الطعام (الحد الأقصى 10)",
      "addItemChooseFromGallery": "اختر من المعرض",
      "AddPhotos": "رفع الصور",
      "Map": "الخريطة",
      "Submit": "تأكيد",
      "quantityselect": "الرجاء تحديد الكمية أو إدخال رقم صالح",
      "photoselect": "الرجاء اختيار صورة واحدة على الأقل",
      "photolimit": "يمكنك تحميل ما يصل إلى 10 صور فقط",
      "LimitReached": "تم الوصول إلى الحد الأقصى",
      "failpickphtot": "تعذر اختيار الصورة",
      "failupdate": "فشل التحديث",
      "Servererror": "خطأ في الخادم",
      "faildeletefood": "فشل في حذف عنصر الطعام",
      "errormessagedonor": "حدث خطأ ما",
      "Noresultsfound": "لم يتم العثور على نتائج",
      "Searchfailed": "فشل البحث",
    },
    "en": {
      "addItemTitle": "Donate food",
      "addItemPhotos":"Food Photos (Max 10)",
      "addItemChooseFromGallery": "Choose from Gallery",
      "AddPhotos": "Upload photos",
      "Map": "Map",
      "Submit": "Submit",
      "quantityselect": "Please select a quantity or enter a valid number",
      "photoselect": "Please select at least one photo",
      "photolimit": "You can upload up to 10 images only",
      "LimitReached": "Limit Reached",
      "failpickphtot": "Could not pick image",
      "failupdate": "Failed to update",
      "Servererror": "Server error",
      "faildeletefood": "Failed to delete food item",
      "errormessagedonor": "Something went wrong",
      "Noresultsfound": "No results found",
      "Searchfailed": "Search failed",
    },
  };

  static final Map<String, Map<String, String>> chatsTranslations = {
    "ar": {
      "chatsTitle": "الرسائل",
      "chatsSearchBar": "ابحث باسم المستخدم...",
      "chatstypeMessage": "اكتب رسالة...",
      "Retry": "إعادة المحاولة",
      "chatsEmptytext": "لا توجد محادثات حتى الآن",
      "chatssearchnotic": "الرجاء إدخال حرفين على الأقل",
      "Notice": "ملاحظة",
      "Error": "خطأ",
      "failedsearch": "فشل البحث عن المستخدمين:",
      "emptymessage": "لا يمكن أن تكون الرسالة فارغة",
      "failmessage": "فشل في إرسال الرسالة",
      "errormessage": "حدث خطأ غير متوقع",
    },
    "en": {
      "chatsTitle": "Messages",
      "chatsSearchBar":"Search by username...",
      "chatstypeMessage": "Type a message...",
      "Retry": "Retry",
      "chatsEmptytext": "No conversations yet",
      "chatssearchnotic": "Please enter at least 2 characters",
      "Notice": "Notice",
      "Error": "Error",
      "failedsearch": "Failed to search users",
      "emptymessage": "Message cannot be empty",
      "failmessage": "Failed to send message",
      "errormessage": "An unexpected error occurred",
    },
  };

  static final Map<String, Map<String, String>> notificationsTranslations = {
    "ar": {
      "NotificationsTitle": "الاشعارات",

    },
    "en": {
      "NotificationsTitle": "Notifications",
    },
  };

  static final Map<String, Map<String, String>> goalsTranslations = {
    "ar": {
      "ProgressTitle": "تقدمك",
      "Congrats": "تهانينا!",
      "CongratsBody": "لقد أكملت جميع أهدافك!",
      "Statrtagain": "ابدأ من جديد",
      "completed": "تم الإنجاز!",
      "markascomplete": "وضع كمنجز",
      "goals_count": "{completed}/{total} من الأهداف مكتملة",
      "completed_percentage": "{percent}% تم الإنجاز",
      "goal_1_title": "تبرع بـ 5 وجبات 🍱",
      "goal_1_desc": "ابدأ رحلتك بمساعدة 5 أشخاص محتاجين.",
      "goal_2_title": "شارك التطبيق مع صديق 👥",
      "goal_2_desc": "انشر الخير للآخرين.",
      "goal_3_title": "تبرع أكثر من مرة في الأسبوع ♻️",
      "goal_3_desc": "الثبات هو مفتاح التغيير.",
      "goal_4_title": "تبرع بالطعام قبل انتهاء صلاحيته بـ 3 أيام ⏳",
      "goal_4_desc": "قلل الهدر وأنقذ الطعام من الضياع.",
      "goal_5_title": "استلم طعام مرة واحدة كمستفيد 👤",
      "goal_5_desc": "اختبر الجانب الآخر لفهم وتحسين.",
      "goal_6_title": "قيم التطبيق 🌟",
      "goal_6_desc": "ساعدنا للوصول لمزيد من الناس."
    },
    "en": {
      "ProgressTitle": "Your Progress",
      "Congrats": "Congratulations!",
      "CongratsBody": "You've completed all your goals!",
      "Statrtagain": "Start Again",
      "completed": "Completed!",
      "markascomplete": "Mark as Completed",
      "goals_count": "{completed}/{total} Goals Completed",
      "completed_percentage": "{percent}% Completed",
      "goal_1_title": "Donate 5 Meals 🍱",
      "goal_1_desc": "Start your journey by helping 5 people in need.",
      "goal_2_title": "Share the App with a Friend 👥",
      "goal_2_desc": "Spread the goodness to others.",
      "goal_3_title": "Donate More Than Once in a Week ♻️",
      "goal_3_desc": "Consistency is the key to change.",
      "goal_4_title": "Donate Food 3 Days Before Expiry ⏳",
      "goal_4_desc": "Reduce waste and save food from being lost.",
      "goal_5_title": "Receive Food Once as a Recipient 👤",
      "goal_5_desc": "Experience the other side to understand and improve.",
      "goal_6_title": "Rate the App 🌟",
      "goal_6_desc": "Help us reach more people."
    },
  };

  static final Map<String, Map<String, String>> recHomePageTranslations = {
    "ar": {
      "ResetFilters": "إعادة تعيين الفلاتر",
      "DonorInfo": "المتبرع : {username}",
      "Donor": "المتبرع",
      "Unknown": "غير معروف",
      "ItemCount": "لديك {count} عنصر في قائمتك"



    },
    "en": {
      "ResetFilters": "Reset Filters",
      "DonorInfo": "Donor : {username}",
      "Donor": "Donor",
      "Unknown": "Unknown",
      "ItemCount": "You have {count} items in your list"

    },
  };

  static final Map<String, Map<String, String>> adminTranslations = {
    "ar" : {
      "Requests": "الطلبات",
      "FoodListsTitle": "قوائم الطعام : ",
      "FoodEmptyRequsets": "لم يتم العثور على عناصر طعام",
      "InvalidFood": "عنصر طعام غير صالح",
      "moreImages": "اخرين",
      "FoodRequsetTitle": "طلبات الطعام : ",
      "Approve": "قبول",
      "Dismiss": "رفض",
      "DetailsTitle1": "تفاصيل الطعام",
      "Analysis": "الاحصائيات",
      "AppAnalysis": "تحليل التطبيق",
      "FoodStatusSummary": "ملخص حالة الطعام",
      "OrdersRatingSummary": "ملخص تقييم الطلبات",
      "PendingApproval": "قيد المراجعة",
      "Approved": "تم القبول",
      "Archived": "مؤرشفة",
      "Dismissed": "مرفوض",
      "approvenotf": "تم إرسال موافقتك بنجاح",
      "failapprovenotf": "لم يتم إرسال موافقتك بنجاح",
      "dismissnotf": "تم إرسال رفضك بنجاح",
      "faildismissnotf": "لم يتم إرسال رفضك بنجاح",
      "success": "نجاح",
      "fail": "فشل",
    },
    "en": {
      "Requests": "Requests",
      "FoodListsTitle": " Food Lists : ",
      "FoodEmptyRequsets": "No food items found",
      "InvalidFood": "Invalid food item",
      "moreImages": "more",
      "FoodRequsetTitle": "Food Requests : ",
      "Approve": "Approve",
      "Dismiss": "Dismiss",
      "DetailsTitle1": "Food Details",
      "Analysis": "Analysis",
      "AppAnalysis": "App Analysis",
      "FoodStatusSummary": "Food Status Summary",
      "OrdersRatingSummary": "Orders Rating Summary",
      "PendingApproval": "Pending Approval",
      "Approved": "Approved",
      "Archived": "Archived",
      "Dismissed": "Dismissed",
      "approvenotf": "your approve sent successfully",
      "failapprovenotf": "your approve does not sent successfully",
      "dismissnotf": "your dismiss sent successfully",
      "faildismissnotf": "your dismiss does not sent successfully",
      "success": "success",
      "fail": "fail",
    },
  };

  static final Map<String, Map<String, String>> filterTranslations = {
    "ar": {
      "FilterFood": "تصفية الطعام",
      "foodType": "نوع الطعام",
      "searchtype": "ابحث بنوع الطعام",
      "Quantity": "الكمية",
      "ExpirationDate": "تاريخ الانتهاء",
      "Withinaday": "خلال يوم",
      "Withinaweek": "خلال أسبوع",
      "Withinamonth": "خلال شهر",
      "Distance": "المسافة",
      "Enable Distance Filter": "تفعيل تصفية المسافة",
      "Maximum Distance": "أقصى مسافة",
      "Show food within": "عرض الطعام ضمن",
      "ShowDistance": "اعرض الطعام في نطاق {distance} كم",
      "km": "كم",
      "SortBy": "ترتيب حسب",
      "Newest": "الأحدث",
      "Closest": "الأقرب",
      "Apply": "تطبيق",
      "Reset": "إعادة تعيين",
      "Notice": "ملاحظة",
      "Distance filter is recommended when sorting by closest": "يفضل تفعيل تصفية المسافة عند الترتيب حسب الأقرب"
    },
    "en": {
      "FilterFood": "Filter Food",
      "foodType": "Food Type",
      "searchtype": "Search by type",
      "Quantity": "Quantity",
      "ExpirationDate": "Expiration Date",
      "Withinaday": "Within a day",
      "Withinaweek": "Within a week",
      "Withinamonth": "Within a month",
      "Distance": "Distance",
      "Enable Distance Filter": "Enable Distance Filter",
      "Maximum Distance": "Maximum Distance",
      "Show food within": "Show food within",
      "ShowDistance": "Show food within {distance} km",
      "km": "km",
      "SortBy": "Sort By",
      "Newest": "Newest",
      "Closest": "Closest",
      "Apply": "Apply",
      "Reset": "Reset",
      "Notice": "Notice",
      "Distance filter is recommended when sorting by closest": "Distance filter is recommended when sorting by closest"
    }
  };
  
  static final Map<String, Map<String, String>> archiveTranslations = {
    "ar": {
      "Rating": "تقييم",
      "Details": "التفاصيل",
      "OrderNumber": "رقم الطلب",
      "OrderStatus": "حالة الطلب",
      "Delete": "إزالة",
      "Markasrecieved": "تأكيد الإستلام",
    },
    "en": {
      "Rating": "Rating",
      "Details": "Details",
      "OrderNumber": "Order Number",
      "OrderStatus": "Order Status",
      "Delete": "Delete",
      "Markasrecieved": "Mark as recieved",
      
    },
  };

  static final Map<String, Map<String, String>> ratingTranslations = {
    "ar": {
      "RatingDialog": "نافذة التقييم",
      "Star": "اضغط علي النجمة لتحديد تقييمك . يمكنك إضافة وصف أو تعليق إذا رغبت",
      "submitbut": "إرسال",
      "hinttext": "أخبرنا بما أعجبك أو كيف يمكننا التحسين",
    },
    "en": {
      "RatingDialog": "Rating Dialog",
      "Star": "Tap a star to set your rating. Add more description here if you want.",
      "submitbut": "Submit",
      "hinttext": "Tell us what you liked or how we can improve",
      
    },
  };

  static final Map<String, Map<String, String>> recdetailsTranslations = {
    "ar": {
      "ADDbut": "إضافة ",
      "removebut": "حذف",
    },
    "en": {
      "ADDbut": "Add ",
      "removebut": "remove ",
      
    },
  };

  static final Map<String, Map<String, String>> orddetailsTranslations = {
    "ar": {
      "OrdersDetails": "تفاصيل الطلب ",
      "Item": "العنصر",
    },
    "en": {
      "OrdersDetails": "Orders Details ",
      "Item": "Item ",
      
    },
  };

  static final Map<String, Map<String, String>> RecSearchTranslations = {
    "ar": {
      "SearchRecTitle": "بحث عن طعام",
      "SearchDetial": "ابحث عن عنوان الطعام، النوع...",
      "SearchRecBody": "نتائج البحث:",
    },
    "en": {
      "SearchRecTitle": "Search Food",
      "SearchDetial": "Search for food title, type...",
      "SearchRecBody": "Search Results:",

    },
  };

  static final Map<String, Map<String, String>> AddressesTranslations = {
    "ar": {
      "Address": "العنوان",
      "AddNewAddress": "أضف عنوان جديد",
      "AddAddressDetails": "أضف تفاصيل العنوان",
      "Continue": "استمرار",
      "City": "المدينة",
      "Street": "الشارع",
      "Name": "الاسم",
      "Add": "اضافة",
      "turnonlocationpermission": "الرجاء تشغيل إذن الموقع",
      "permissionaccesslocation": "يرجى إعطاء الإذن للوصول إلى الموقع",
      "notuseappwithoutloc": "لا يمكنك استخدام التطبيق بدون تحديد الموقع",
    },
    "en": {
      "Address": "Address",
      "AddNewAddress": "Add new address",
      "AddAddressDetails": "Add address details",
      "Continue": "Continue",
      "City": "City",
      "Street": "Street",
      "Name": "Name",
      "Add": "Add",
      "turnonlocationpermission": "please turn on location permission",
      "permissionaccesslocation": "please give the permission for access location",
      "notuseappwithoutloc": "you can not use the app without location",
    },
  };

  static final Map<String, Map<String, String>> ValidationTranslations = {
    "ar": {
      "foodTitleValidation": "يرجى إدخال عنوان الطعام",
      "foodTypeValidation": "يرجى إدخال نوع الطعام",
      "descriptionValidation": "يرجى إدخال وصف الطعام",
      "expiryDateValidation": "يرجى اختيار تاريخ الانتهاء",
      "cityValidation": "يرجى إدخال اسم المدينة",
      "streetValidation": "يرجى إدخال اسم الشارع",
      "NameValidation": "يرجى إدخال اسم العنوان"
    },
    "en": {
      "foodTitleValidation": "Please enter a food title",
      "foodTypeValidation": "Please enter a food type",
      "descriptionValidation": "Please enter a description",
      "expiryDateValidation": "Please select the expiry date",
      "cityValidation": "Please select city",
      "streetValidation": "Please select street",
      "NameValidation": "Please select name"
    },
  };

  static final Map<String, Map<String, String>> cartTranslations = {
    "ar": {
      "maxquantity": "لقد وصلت إلى الكمية القصوى",
      "addcartsuccess": "تمت إضافة العنصر الغذائي إلى سلة التسوق بنجاح",
      "deletfoodsuccess": "تم حذف العنصر الغذائي من سلة التسوق بنجاح",
      "notificationcart": "إشعار",
      "Locationdisabled": "خدمات الموقع معطلة",
      "Locationpermissionsdenied": "أذونات الموقع مرفوضة",
      "Error": "خطأ",
      "Failedgetlocation": "فشل في الحصول على الموقع",
      "Failedapplyfilters": "فشل في تطبيق المرشحات",
      "reservationdonesuccessfully": "تم الحجز بنجاح",
    },

    "en": {
      "maxquantity": "you reach the max quantity",
      "addcartsuccess": "food item has been added to the cart successfully",
      "deletfoodsuccess": "food item has been deleted from the cart successfully",
      "notificationcart": "notification",
      "Locationdisabled": "Location services are disabled",
      "Locationpermissionsdenied": "Location permissions are denied",
      "Error": "Error",
      "Failedgetlocation": "Failed to get location",
      "Failedapplyfilters": "Failed to apply filters",
      "reservationdonesuccessfully": "The reservation done successfully",
    },
  };

}