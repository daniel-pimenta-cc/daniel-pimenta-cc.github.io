part of values;

/// Strings que NÃO variam com o idioma: rotas, URLs, nomes próprios,
/// marcas, fontes e afins.
class StringConst {
  //strings
  static const String APP_NAME = "Daniel Pimenta";
  static const String APP_TITLE = "Daniel Pimenta - FullStack Dev";
  static const String SITE_URL = "https://dspimenta.com";

  static const String HOME = "Home";
  static const String SERVICES = "Services";
  static const String CONTACT = "Contact";
  static const String PHONE_NUMBER = "Phone Number";
  static const String EMAIL_VALUE = "danipimentasousa@gmail.com";

  static const String MESSAGE_ME = "Message me";
  static const String GET_IN_TOUCH = "Get in touch";
  static const String COMING_SOON = "COMING SOON !!";
  static const String BUILT_WITH = "Built with ";
  static const String DEV_EMAIL = "danipimentasousa@gmail.com";
  static const String EMAIL_URL = "mailto:<$DEV_EMAIL>?subject=&body=";

  static const String EXPERIENCE_2 = "EXPERIENCE";

  static const String PROJECT_NAME = "Project Name";

  static const String DEV_NAME = "Daniel Pimenta";

  //Form Hint Texts
  static const String NAME_HINT_TEXT = "Name";
  static const String PHONE_HINT_TEXT = "Phone (Optional)";
  static const String EMAIL_HINT_TEXT = "Email";
  static const String MESSAGE_HINT_TEXT = "Message";

  static const String SEND_MESSAGE = "Send Message";

  //Skills
  static const String FLUTTER = "Flutter";
  static const String JAVA = "Java";
  static const String ANDROID = "Android";
  static const String JAVASCRIPT = "Javascript";
  static const String PHP = "PHP";
  static const String LARAVEL = "Laravel";
  static const String SQL = "SQL";
  static const String WORDPRESS = "Wordpress";
  static const String BOOTSTRAP = "Bootstrap";
  static const String HTML_CSS = "HTML/CSS";
  static const String PYTHON = "Python";
  static const String REST_API = "RestAPI";

  //routes
  static const String HOME_PAGE = "/";
  static const String ABOUT_PAGE = "/sobre";
  static const String PORTFOLIO_PAGE = "/portfolio";
  static const String CONTACT_PAGE = "/contact";
  static const String PROJECT_PAGE = "/project";
  static const String PROJECT_DETAIL_PAGE = "/project-detail";
  static const String SERVICES_PAGE = "/services";
  static const String MESSAGE_PAGE = "/message-me";
  static const String EXPERIENCE_PAGE = "/experiencia";
  static const String RESUME_PAGE = "/resume";
  static const String CERTIFICATION_PAGE = "/certifications";

  //Socials
  static const String GITHUB_URL = "https://github.com/daniel-pimenta-cc";
  static const String LINKED_IN_URL =
      "https://www.linkedin.com/in/daniel-pimenta-cc/";
  static const String TWITTER_URL = "https://twitter.com/dpimenta_dev";
  static const String INSTAGRAM_URL = "https://www.instagram.com/ds_pimenta/";
  static const String TELEGRAM_URL = "https://www.instagram.com/ds_pimenta/";
  static const String WHATSAPP_URL = "https://wa.me/5522992742705";

  //Contacts
  static const String CONNECT = "Connect with me";
  static const String EMAIL = "Email";
  static const String LINKED_IN = "LINKEDIN";
  static const String TWITTER = "TWITTER";
  static const String INSTAGRAM = "INSTAGRAM";
  static const String TELEGRAM = "TELEGRAM";

  //Certificate Urls
  static const String ASSOCIATE_ANDROID_DEV_URL =
      "https://www.credential.net/b296da88-d6be-4bb5-9756-b13efea3a421";
  static const String DATA_SCIENCE_CERT_URL =
      "https://graduation.udacity.com/confirm/7CGEJAFR";
  static const String ANDROID_BASICS_CERT_URL =
      "https://graduation.udacity.com/confirm/9VTDRN5K";

  //AwardedBy
  static const String GOOGLE = "Google";
  static const String UDACITY = "Udacity";

  //CertificationType
  static const String ASSOCIATE_ANDROID_DEV = "Associate Android Developer";
  static const String DATA_SCIENCE = "Data Science";
  static const String ANDROID_BASICS = "Android Basics";

  //Experience
  static const String CURRENT_MONTH_YEAR = "Jul 2026";
  static const String STARTED_MONTH_YEAR = "Jun 2018";

  static const String COMPANY_1 = "LicitUbá";
  static const String LOCATION_1 = "Ubá - Minas Gerais";

  static const String COMPANY_2 = "Bigou";
  static const String COMPANY_2_URL = "https://bigou.com.br/";
  static const String LOCATION_2 = "Rio Pomba - Minas Gerais";

  static const String COMPANY_3 = "EmComp";
  static const String COMPANY_3_URL = "https://emcomp.com.br/";
  static const String LOCATION_3 = "Rio Pomba - Minas Gerais";

  static const String COMPANY_4 = "Mimetics";
  static const String LOCATION_4 = "Cabo Frio - Rio de Janeiro";

  static const String COMPANY_5 = "Tedsys Software";
  static const String LOCATION_5 = "Cabo Frio - Rio de Janeiro";

  static const String COMPANY_6 = "Freelancer";

  static const String COMPANY_7 = "Real33";

  //Portfolio, Projects
  static const String INKEDSYNC = "InkedSync";
  static const String INKEDSYNC_WEB_URL = "https://inkedsync.com";

  static const String LEDOR = "Ledor";
  static const String LEDOR_GITHUB_URL =
      "https://github.com/daniel-pimenta-cc/ledor";
  static const String LEDOR_WEB_URL = "https://ledor.app";

  static const String NEXTREAD = "NextRead";
  static const String NEXTREAD_WEB_URL = "https://nextread.com.br";

  static const String CIRCE = "Circe";
  static const String PROXIMA_NOVA = "ProximaNova";

  static const String SEND_END_POINT = "send";
}

/// Idioma atual do site. `S` dá acesso às strings localizadas.
class I18n {
  static final ValueNotifier<String> locale = ValueNotifier("pt");
  static const Strings _pt = StringsPt();
  static const Strings _en = StringsEn();

  static Strings get s => locale.value == "en" ? _en : _pt;

  static void toggle() => locale.value = locale.value == "en" ? "pt" : "en";

  static void init(String browserLanguage) =>
      locale.value = browserLanguage.startsWith("pt") ? "pt" : "en";

  // O toggle recria o Navigator (key no MaterialApp); guardamos a rota atual
  // pra reabrir onde o visitante estava. Só rotas sem argumentos.
  static String? _routeHint;
  static String get initialRoute => _routeHint ?? StringConst.HOME_PAGE;

  static void toggleFrom(String? currentRoute) {
    const restorable = {
      StringConst.HOME_PAGE,
      StringConst.ABOUT_PAGE,
      StringConst.PORTFOLIO_PAGE,
      StringConst.EXPERIENCE_PAGE,
    };
    _routeHint = restorable.contains(currentRoute) ? currentRoute : null;
    toggle();
  }
}

Strings get S => I18n.s;

/// Strings localizadas (PT/EN).
abstract class Strings {
  String get ABOUT_ME;
  String get PORTFOLIO;
  String get EXPERIENCE;
  String get WORK;
  String get RESUME;
  String get CERTIFICATIONS;
  String get VIEW;
  String get KEY_SKILLS;
  String get EDUCATION;
  String get HABILITIES;
  String get SEND_ME_A_MESSAGE;
  String get VIEW_PORTFOLIO;
  String get INTRO;
  String get PUNCH_LINE;
  String get TYPED_LINE_1;
  String get TYPED_LINE_2;
  String get TYPED_LINE_3;
  String get SPECIALITY;
  String get ABOUT_DEV_TEXT;
  String get HABILITIES_TEXT;
  String get EDUCATION_TEXT;

  String get POSITION_1;
  String get COMPANY_1_ROLE_1;
  String get COMPANY_1_ROLE_2;
  String get COMPANY_1_ROLE_3;
  String get DURATION_1;

  String get POSITION_2;
  String get COMPANY_2_ROLE_1;
  String get COMPANY_2_ROLE_2;
  String get COMPANY_2_ROLE_3;
  String get DURATION_2;

  String get POSITION_3;
  String get COMPANY_3_ROLE_1;
  String get COMPANY_3_ROLE_2;
  String get DURATION_3;

  String get POSITION_4;
  String get COMPANY_4_ROLE_1;
  String get COMPANY_4_ROLE_2;
  String get COMPANY_4_ROLE_3;
  String get COMPANY_4_ROLE_4;
  String get DURATION_4;

  String get POSITION_5;
  String get COMPANY_5_ROLE_1;
  String get COMPANY_5_ROLE_2;
  String get COMPANY_5_ROLE_3;
  String get COMPANY_5_ROLE_4;
  String get COMPANY_5_ROLE_5;
  String get DURATION_5;

  String get POSITION_6;
  String get COMPANY_6_ROLE_1;
  String get COMPANY_6_ROLE_2;
  String get COMPANY_6_ROLE_3;
  String get LOCATION_6;
  String get DURATION_6;

  String get POSITION_7;
  String get COMPANY_7_ROLE_1;
  String get COMPANY_7_ROLE_2;
  String get COMPANY_7_ROLE_3;
  String get LOCATION_7;
  String get DURATION_7;

  String get INKEDSYNC_SUBTITLE;
  String get INKEDSYNC_DETAIL;
  String get LEDOR_SUBTITLE;
  String get LEDOR_DETAIL;
  String get NEXTREAD_SUBTITLE;
  String get NEXTREAD_DETAIL;
}

class StringsPt implements Strings {
  const StringsPt();

  @override
  String get ABOUT_ME => "Sobre mim";
  @override
  String get PORTFOLIO => "Portfólio";
  @override
  String get EXPERIENCE => "Experiência";
  @override
  String get WORK => "Onde já trabalhei";
  @override
  String get RESUME => "Currículo";
  @override
  String get CERTIFICATIONS => "Interesses";
  @override
  String get VIEW => "Detalhes";
  @override
  String get KEY_SKILLS => "Linguagens e Frameworks";
  @override
  String get EDUCATION => "Educação";
  @override
  String get HABILITIES => "Habilidades";
  @override
  String get SEND_ME_A_MESSAGE => "Entre em contato ";
  @override
  String get VIEW_PORTFOLIO => "Ver Portfólio";
  @override
  String get INTRO => "Olá, meu nome é";
  @override
  String get PUNCH_LINE => "Dev full-stack: web, mobile e backend";
  @override
  String get TYPED_LINE_1 => "Desenvolvedor Full Stack";
  @override
  String get TYPED_LINE_2 => "Graduando em Computação";
  @override
  String get TYPED_LINE_3 => "Artista 3D";
  @override
  String get SPECIALITY => "Desenvolvedor Full-Stack";
  @override
  String get ABOUT_DEV_TEXT =>
      "   Desenvolvedor full-stack com 8+ anos de experiência, do freela ao contrato de longo prazo. Hoje sou o responsável técnico do Real33 — plataforma completa para corretores imobiliários — e mantenho produtos próprios em produção: InkedSync, Ledor e NextRead.\n\n   Comecei a programar aos 13, entrei no mundo dev pela área de jogos (modelagem 3D, arte digital) e cursei Ciência da Computação no Instituto Federal, onde atuei no grupo de hardware/software livre e na empresa júnior. Desde 2018 entrego sistemas como freelancer: backends, integrações, e-commerce, apps Android e automações.\n\n   Sou multidisciplinar por natureza — eletrônica, reparo de hardware, artesanato — e acredito que isso me ajuda a entender rápido o domínio e as necessidades reais de cada projeto.";
  @override
  String get HABILITIES_TEXT =>
      "   Além da minha experiência profissional com desenvolvimento estou constantemente desenvolvendo projetos pessoais e testando novas tecnologias por hobby, e para colaborar e auxiliar amigos e colegas em seus projetos.\n\n   Possuo também um conhecimento considerável com o Jira, não só no uso como também na configuração, tendo inclusive já realizado algumas integrações entre ele e serviços de terceiros\n\n   E apesar de não ter tido nenhuma experiência profissional formal tenho conhecimentos de eletrônica, e já realizei incontáveis reparos em Computadores, Notebooks, Celulares etc. \n\n   Também sou artesão e faço trabalhos com crochê, desenho e faço arte 3d";
  @override
  String get EDUCATION_TEXT =>
      "   Com 16 anos, entrei no curso de Ciências da Computação no Instituto Federal de Educação, Ciência e Tecnologia do Sudeste de Minas, onde cursei até o 6º período. Lá fiz parte do Grupo de desenvolvimento de Hardware e Software livre - IFGNU onde pude desenvolver experiência trabalhando com microcontroladores como o Arduino e microcomputadores como o Raspberry Pi e também pude me familiarizar com diversos sistemas operacionais baseados em Linux, também fiz parte da empresa júnior da computação, a EmComp, onde colaborei no desenvolvimento de diversos sistemas web tanto para alunos e docentes quanto para empresários locais";

  @override
  String get POSITION_1 => "Sysadmin - Estágio";
  @override
  String get COMPANY_1_ROLE_1 =>
      "Manutenção preventiva do servidor e banco de dados";
  @override
  String get COMPANY_1_ROLE_2 =>
      "Atualizações na aplicação Web e no aplicativo Android";
  @override
  String get COMPANY_1_ROLE_3 =>
      "Implementação e monitoramento de procedimentos automatizados de backup";
  @override
  String get DURATION_1 => "Jun 2019 - Jan 2020";

  @override
  String get POSITION_2 => "Assistente de marketing";
  @override
  String get COMPANY_2_ROLE_1 =>
      "Desenvolvimento, criação e gerenciamento de campanhas de marketing digital através das plataformas Facebook Ads e Google Ads";
  @override
  String get COMPANY_2_ROLE_2 =>
      "Criação de artes digitais para os perfis de rede sociais e anúncios";
  @override
  String get COMPANY_2_ROLE_3 =>
      "Elaboração e edição de vídeos promocionais e de instrução";
  @override
  String get DURATION_2 => "Jan 2020 - Fev 2021";

  @override
  String get POSITION_3 => "Desenvolvedor Fullstack";
  @override
  String get COMPANY_3_ROLE_1 =>
      "Desenvolvi sistemas web responsivos para empresas locais e projetos do campus";
  @override
  String get COMPANY_3_ROLE_2 =>
      "Ajudei na manutenção dos servidores usados para a hospedagem dos sites";
  @override
  String get DURATION_3 => "Ago 2019 - Abr 2020";

  @override
  String get POSITION_4 => "Desenvolvedor Back-End Junior";
  @override
  String get COMPANY_4_ROLE_1 =>
      "Desenvolvimento de APIs utilizando FastAPI, SqlAlchemy e PostgreSQL";
  @override
  String get COMPANY_4_ROLE_2 =>
      "Integração de diversas APIs, inclusive de operações financeiras em uma rede social de copy trading";
  @override
  String get COMPANY_4_ROLE_3 =>
      "Modelagem de banco de dados relacionais para diversas aplicações";
  @override
  String get COMPANY_4_ROLE_4 =>
      "Idealização e implementação de uma infraestrutura escalável para uma rede social com bots de automação de operações financeiras";
  @override
  String get DURATION_4 => "Ago 2021 - Fev 2022";

  @override
  String get POSITION_5 => "Programador DevOps";
  @override
  String get COMPANY_5_ROLE_1 =>
      "Monitoramento e manutenção de servidores Linux na AWS";
  @override
  String get COMPANY_5_ROLE_2 =>
      "Desenvolvimento e atualizações de integrações entre sistemas";
  @override
  String get COMPANY_5_ROLE_3 =>
      "Atualizações e manutenções no site da empresa";
  @override
  String get COMPANY_5_ROLE_4 =>
      "Otimização de principais métricas web (FCP,LCP,TTFB....) em sites WordPress";
  @override
  String get COMPANY_5_ROLE_5 =>
      "Desenvolver soluções e auxiliar os responsáveis para coletar dados e gerar KPIs dos respectivos setores";
  @override
  String get DURATION_5 => "Abr 2022 - Dez 2022";

  @override
  String get POSITION_6 => "Desenvolvedor FullStack";
  @override
  String get COMPANY_6_ROLE_1 =>
      "Desenvolvimento backend, integrações entre sistemas e novas features em produtos internos de clientes — trabalho majoritariamente sob NDA";
  @override
  String get COMPANY_6_ROLE_2 =>
      "Mais de 10 sistemas entregues desde 2018: e-commerce com rede MLM, bots de automação de trading, apps Android nativos, sites e automações";
  @override
  String get COMPANY_6_ROLE_3 =>
      "Manutenção, correção de bugs e otimização de performance em sistemas em produção";
  @override
  String get LOCATION_6 => "Remoto";
  @override
  String get DURATION_6 => "Jun 2018 - Atualmente";

  @override
  String get POSITION_7 => "Desenvolvedor Full-Stack (contrato fixo)";
  @override
  String get COMPANY_7_ROLE_1 =>
      "Desenvolvimento de plataforma que centraliza a rotina do corretor de imóveis: gestão de clientes e imóveis, portal de divulgação, fichas de visita digitais, contratos a partir de modelos e vistorias";
  @override
  String get COMPANY_7_ROLE_2 =>
      "Responsável técnico de ponta a ponta, da concepção das funcionalidades ao deploy";
  @override
  String get COMPANY_7_ROLE_3 =>
      "Produto em fase final de desenvolvimento, com teste fechado previsto";
  @override
  String get LOCATION_7 => "Remoto";
  @override
  String get DURATION_7 => "Jan 2025 - Atualmente";

  @override
  String get INKEDSYNC_SUBTITLE =>
      "Gestão completa para tatuadores: agenda, clientes e finanças";
  @override
  String get INKEDSYNC_DETAIL =>
      "App que centraliza a rotina do estúdio de tatuagem: agendamentos, cadastro e histórico de clientes e controle financeiro. App em Flutter com API própria em Python. Em beta fechado — inscrições abertas no site.";
  @override
  String get LEDOR_SUBTITLE => "Leitor open source de leitura dinâmica";
  @override
  String get LEDOR_DETAIL =>
      "Speed reader com RSVP e destaque ORP, modos e-reader, rolagem contínua e TTS. Lê EPUB e artigos da web, com estatísticas de leitura e sincronização opcional via Google Drive. Feito em Flutter, para Android e Linux — código aberto no GitHub.";
  @override
  String get NEXTREAD_SUBTITLE =>
      "Sua estante de leitura com recomendações por IA";
  @override
  String get NEXTREAD_DETAIL =>
      "Organize o que você quer ler, está lendo e já leu — e receba recomendações geradas por IA a partir do seu histórico de leitura. API REST em Laravel, SPA em Angular e integrações com APIs de livros.";
}

class StringsEn implements Strings {
  const StringsEn();

  @override
  String get ABOUT_ME => "About me";
  @override
  String get PORTFOLIO => "Portfolio";
  @override
  String get EXPERIENCE => "Experience";
  @override
  String get WORK => "Where I've worked";
  @override
  String get RESUME => "Resume";
  @override
  String get CERTIFICATIONS => "Interests";
  @override
  String get VIEW => "Details";
  @override
  String get KEY_SKILLS => "Languages & Frameworks";
  @override
  String get EDUCATION => "Education";
  @override
  String get HABILITIES => "Skills";
  @override
  String get SEND_ME_A_MESSAGE => "Get in touch ";
  @override
  String get VIEW_PORTFOLIO => "View portfolio";
  @override
  String get INTRO => "Hi, my name is";
  @override
  String get PUNCH_LINE => "Full-stack dev: web, mobile & backend";
  @override
  String get TYPED_LINE_1 => "Full Stack Developer";
  @override
  String get TYPED_LINE_2 => "Computer Science student";
  @override
  String get TYPED_LINE_3 => "3D Artist";
  @override
  String get SPECIALITY => "Full-Stack Developer";
  @override
  String get ABOUT_DEV_TEXT =>
      "   Full-stack developer with 8+ years of experience, from freelance work to long-term contracts. I'm currently the technical owner of Real33 — a complete platform for real estate agents — and I maintain my own products in production: InkedSync, Ledor and NextRead.\n\n   I started programming at 13, got into development through games (3D modeling, digital art) and studied Computer Science at a Federal Institute, where I joined the free hardware/software group and the computing junior enterprise. Since 2018 I've been delivering systems as a freelancer: backends, integrations, e-commerce, Android apps and automations.\n\n   I'm multidisciplinary by nature — electronics, hardware repair, handcrafting — and I believe that helps me quickly understand the domain and the real needs of every project.";
  @override
  String get HABILITIES_TEXT =>
      "   Beyond my professional work I'm constantly building personal projects and trying new technologies as a hobby, and to collaborate with friends and colleagues on their projects.\n\n   I also have solid knowledge of Jira — not only using it but also configuring it, including integrations between it and third-party services.\n\n   I have a background in electronics as well, and have done countless repairs on computers, laptops, phones and more. \n\n   I'm also a craftsman: crochet, drawing and 3D art";
  @override
  String get EDUCATION_TEXT =>
      "   At 16 I joined the Computer Science program at the Federal Institute of Education, Science and Technology of Southeast Minas Gerais, which I attended through the 6th semester. There I was part of IFGNU — the free hardware and software development group — where I gained experience with microcontrollers like the Arduino and single-board computers like the Raspberry Pi, and got familiar with several Linux-based operating systems. I was also part of EmComp, the computing junior enterprise, collaborating on web systems for students, faculty and local businesses";

  @override
  String get POSITION_1 => "Sysadmin - Internship";
  @override
  String get COMPANY_1_ROLE_1 =>
      "Preventive maintenance of the server and database";
  @override
  String get COMPANY_1_ROLE_2 =>
      "Updates to the web application and the Android app";
  @override
  String get COMPANY_1_ROLE_3 =>
      "Implementation and monitoring of automated backup procedures";
  @override
  String get DURATION_1 => "Jun 2019 - Jan 2020";

  @override
  String get POSITION_2 => "Marketing Assistant";
  @override
  String get COMPANY_2_ROLE_1 =>
      "Planning, creation and management of digital marketing campaigns on Facebook Ads and Google Ads";
  @override
  String get COMPANY_2_ROLE_2 =>
      "Digital artwork for social media profiles and ads";
  @override
  String get COMPANY_2_ROLE_3 =>
      "Production and editing of promotional and instructional videos";
  @override
  String get DURATION_2 => "Jan 2020 - Feb 2021";

  @override
  String get POSITION_3 => "Fullstack Developer";
  @override
  String get COMPANY_3_ROLE_1 =>
      "Built responsive web systems for local businesses and campus projects";
  @override
  String get COMPANY_3_ROLE_2 =>
      "Helped maintain the servers used to host the websites";
  @override
  String get DURATION_3 => "Aug 2019 - Apr 2020";

  @override
  String get POSITION_4 => "Junior Back-End Developer";
  @override
  String get COMPANY_4_ROLE_1 =>
      "API development with FastAPI, SQLAlchemy and PostgreSQL";
  @override
  String get COMPANY_4_ROLE_2 =>
      "Integration of several APIs, including financial operations in a copy-trading social network";
  @override
  String get COMPANY_4_ROLE_3 =>
      "Relational database modeling for several applications";
  @override
  String get COMPANY_4_ROLE_4 =>
      "Design and implementation of a scalable infrastructure for a social network with trading automation bots";
  @override
  String get DURATION_4 => "Aug 2021 - Feb 2022";

  @override
  String get POSITION_5 => "DevOps Developer";
  @override
  String get COMPANY_5_ROLE_1 =>
      "Monitoring and maintenance of Linux servers on AWS";
  @override
  String get COMPANY_5_ROLE_2 =>
      "Development and updates of integrations between systems";
  @override
  String get COMPANY_5_ROLE_3 =>
      "Updates and maintenance of the company website";
  @override
  String get COMPANY_5_ROLE_4 =>
      "Optimization of core web metrics (FCP, LCP, TTFB...) on WordPress sites";
  @override
  String get COMPANY_5_ROLE_5 =>
      "Built solutions to collect data and generate KPIs for the respective departments";
  @override
  String get DURATION_5 => "Apr 2022 - Dec 2022";

  @override
  String get POSITION_6 => "Fullstack Developer";
  @override
  String get COMPANY_6_ROLE_1 =>
      "Backend development, system integrations and new features in clients' internal products — mostly under NDA";
  @override
  String get COMPANY_6_ROLE_2 =>
      "10+ systems delivered since 2018: MLM e-commerce, trading automation bots, native Android apps, websites and automations";
  @override
  String get COMPANY_6_ROLE_3 =>
      "Maintenance, bug fixing and performance optimization of production systems";
  @override
  String get LOCATION_6 => "Remote";
  @override
  String get DURATION_6 => "Jun 2018 - Present";

  @override
  String get POSITION_7 => "Full-Stack Developer (long-term contract)";
  @override
  String get COMPANY_7_ROLE_1 =>
      "Development of a platform that centralizes the real estate agent's routine: client and property management, listing portal, digital visit forms, template-based contracts and inspections";
  @override
  String get COMPANY_7_ROLE_2 =>
      "End-to-end technical owner, from feature design to deployment";
  @override
  String get COMPANY_7_ROLE_3 =>
      "Product in final development stage, with a closed beta coming soon";
  @override
  String get LOCATION_7 => "Remote";
  @override
  String get DURATION_7 => "Jan 2025 - Present";

  @override
  String get INKEDSYNC_SUBTITLE =>
      "Complete management for tattoo artists: schedule, clients and finances";
  @override
  String get INKEDSYNC_DETAIL =>
      "App that centralizes the tattoo studio routine: appointments, client records and history, and financial tracking. Flutter app with its own Python API. In closed beta — sign-ups open on the website.";
  @override
  String get LEDOR_SUBTITLE => "Open source speed-reading app";
  @override
  String get LEDOR_DETAIL =>
      "Speed reader with RSVP and ORP highlighting, e-reader, continuous scroll and TTS modes. Reads EPUB and web articles, with reading stats and optional Google Drive sync. Built with Flutter for Android and Linux — open source on GitHub.";
  @override
  String get NEXTREAD_SUBTITLE =>
      "Your reading shelf with AI-powered recommendations";
  @override
  String get NEXTREAD_DETAIL =>
      "Track what you want to read, are reading and have read — and get AI-generated recommendations based on your reading history. Laravel REST API, Angular SPA and book API integrations.";
}
