part of 'values.dart';

//https://api.github.com/repos/david-legend/aerium/stargazers
//https://api.github.com/repos/david-legend/aerium/forks
class MenuData {
  MenuData({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
    this.database,
    this.python = false,
    this.flutter = false,
    this.html = false,
    this.css = false,
    this.bootstrap = false,
    this.wordpress = false,
    this.php = false,
    this.java = false,
    this.docker = false,
    this.react = false,
    this.javascript = false,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool? isPublic;
  final bool? isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final bool? python;
  final bool? flutter;
  final bool? html;
  final bool? css;
  final bool? bootstrap;
  final bool? wordpress;
  final bool? php;
  final bool? java;
  final bool? docker;
  final bool? react;
  final bool? javascript;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
  final String? database;
}

class PortfolioData {
  PortfolioData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
    this.database = "",
    this.python = false,
    this.flutter = false,
    this.html = false,
    this.css = false,
    this.bootstrap = false,
    this.wordpress = false,
    this.php = false,
    this.java = false,
    this.docker = false,
    this.react = false,
    this.javascript = false,
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
  final String? database;
  final bool? python;
  final bool? flutter;
  final bool? html;
  final bool? css;
  final bool? bootstrap;
  final bool? wordpress;
  final bool? php;
  final bool? java;
  final bool? docker;
  final bool? react;
  final bool? javascript;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    this.company,
    this.companyUrl,
  });

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  // Getters (e não campos estáticos) para reavaliarem as strings quando o
  // idioma muda; o subMenuData é memoizado por idioma porque guarda o estado
  // de seleção das abas.
  static List<MenuData> get menuList => [
    MenuData(title: StringConst.HOME, routeName: HomePage.homePageRoute),
    MenuData(title: S.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: S.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
    MenuData(
      title: S.EXPERIENCE,
      routeName: ExperiencePage.experiencePageRoute,
    ),
    MenuData(title: S.RESUME, routeName: S.RESUME),
  ];

  static String _subMenuLocale = "";
  static List<SubMenuData> _subMenuData = [];
  static List<SubMenuData> get subMenuData {
    if (_subMenuLocale != I18n.locale.value) {
      _subMenuLocale = I18n.locale.value;
      _subMenuData = [
        SubMenuData(
          title: S.KEY_SKILLS,
          isSelected: true,
          isAnimation: true,
        ),
        SubMenuData(
          title: S.HABILITIES,
          isSelected: false,
          content: S.HABILITIES_TEXT,
        ),
        SubMenuData(
          title: S.EDUCATION,
          isSelected: false,
          content: S.EDUCATION_TEXT,
        ),
      ];
    }
    return _subMenuData;
  }

  static List<PortfolioData> get portfolioData => [
    PortfolioData(
      title: StringConst.INKEDSYNC,
      subtitle: S.INKEDSYNC_SUBTITLE,
      image: ImagePath.INKEDSYNC,
      portfolioDescription: S.INKEDSYNC_DETAIL,
      imageSize: 0.3,
      isLive: true,
      webUrl: StringConst.INKEDSYNC_WEB_URL,
      database: "PostgreSQL",
      flutter: true,
      python: true,
    ),
    PortfolioData(
      title: StringConst.LEDOR,
      subtitle: S.LEDOR_SUBTITLE,
      image: ImagePath.LEDOR,
      portfolioDescription: S.LEDOR_DETAIL,
      imageSize: 0.3,
      isPublic: true,
      gitHubUrl: StringConst.LEDOR_GITHUB_URL,
      isLive: true,
      webUrl: StringConst.LEDOR_WEB_URL,
      flutter: true,
    ),
    PortfolioData(
      title: StringConst.NEXTREAD,
      subtitle: S.NEXTREAD_SUBTITLE,
      image: ImagePath.NEXTREAD,
      portfolioDescription: S.NEXTREAD_DETAIL,
      imageSize: 0.3,
      isLive: true,
      webUrl: StringConst.NEXTREAD_WEB_URL,
      php: true,
      javascript: true,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.30,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  static List<ExperienceData> get experienceData => [
    ExperienceData(
      company: StringConst.COMPANY_7,
      position: S.POSITION_7,
      roles: [
        S.COMPANY_7_ROLE_1,
        S.COMPANY_7_ROLE_2,
        S.COMPANY_7_ROLE_3,
      ],
      location: S.LOCATION_7,
      duration: S.DURATION_7,
    ),
    ExperienceData(
      company: StringConst.COMPANY_6,
      position: S.POSITION_6,
      roles: [
        S.COMPANY_6_ROLE_1,
        S.COMPANY_6_ROLE_2,
        S.COMPANY_6_ROLE_3
      ],
      location: S.LOCATION_6,
      duration: S.DURATION_6,
    ),
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: S.POSITION_5,
      roles: [
        S.COMPANY_5_ROLE_1,
        S.COMPANY_5_ROLE_2,
        S.COMPANY_5_ROLE_3,
        S.COMPANY_5_ROLE_4,
        S.COMPANY_5_ROLE_5,
      ],
      location: StringConst.LOCATION_5,
      duration: S.DURATION_5,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: S.POSITION_4,
      roles: [
        S.COMPANY_4_ROLE_1,
        S.COMPANY_4_ROLE_2,
        S.COMPANY_4_ROLE_3,
        S.COMPANY_4_ROLE_4,
      ],
      location: StringConst.LOCATION_4,
      duration: S.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: S.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        S.COMPANY_3_ROLE_1,
        S.COMPANY_3_ROLE_2,
      ],
      location: StringConst.LOCATION_3,
      duration: S.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: S.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        S.COMPANY_2_ROLE_1,
        S.COMPANY_2_ROLE_2,
        S.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: S.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: S.POSITION_1,
      roles: [
        S.COMPANY_1_ROLE_1,
        S.COMPANY_1_ROLE_2,
        S.COMPANY_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: S.DURATION_1,
    ),
  ];
}
