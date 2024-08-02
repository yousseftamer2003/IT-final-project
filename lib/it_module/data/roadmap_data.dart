import 'package:hacker_rank_final/it_module/models/roadmapmodel/Linkdata.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapitem.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapsection.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/roadmapstep.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/section.dart';
import 'package:hacker_rank_final/it_module/models/roadmapmodel/subtitles.dart';

List<RoadmapSection> roadmapsection = [
  RoadmapSection(
      category: 'Mobile Developer',
      sectionTitle: [
        Section(sectiontitle: "RoadMap", steps: [
          RoadmapStepData(
            title: 'Mobile roadmap',
            items: [
              RoadmapItem(title: 'Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'roadmap Link',
                      url:
                          'https://medium.com/@roysalins94/mobile-app-development-learning-roadmap-bad68468b500')
                ], subtitles: 'RoadMap')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Native", steps: [
          RoadmapStepData(
            title: 'Android',
            items: [
              RoadmapItem(title: 'Java', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url:
                          'https://youtube.com/playlist?list=PLCInYL3l2AajYlZGzU_LVrHdoouf8W6ZN&si=mnddNuhJ3pWa3SpS')
                ], subtitles: 'java')
              ]),
              RoadmapItem(title: 'Kotlin', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Kotlincourse Link',
                      url: 'https://youtu.be/C2DBDZKkLss?si=1V4_XSVL68sMyt1L')
                ], subtitles: 'kotlin')
              ]),
              RoadmapItem(title: 'Full course', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'course Link',
                      url:
                          'https://www.udemy.com/course/the-complete-android-oreo-developer-course/?couponCode=LETSLEARNNOWPP')
                ], subtitles: 'full course')
              ]),
            ],
          ),
          RoadmapStepData(
            title: 'Ios',
            items: [
              RoadmapItem(title: 'Swift', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'course Link',
                      url:
                          'https://www.udemy.com/course/the-complete-react-native-and-redux-course/?utm_source=adwords&utm_medium=udemyads&utm_campaign=LongTail_la.EN_cc.ROW&campaigntype=Search&portfolio=ROW-English&language=EN&product=Course&test=&audience=DSA&topic=&priority=&utm_content=deal4584&utm_term=&couponCode=2021PM25')
                ], subtitles: 'Swift')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "FrameWorkes", steps: [
          RoadmapStepData(
            title: 'mobile frameworks',
            items: [
              RoadmapItem(title: 'Flutter', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url:
                          'https://youtube.com/playlist?list=PLGVaNq6mHinjCPki-3xraQdGWKVz7PhgI&si=_HklGvFPft4qL2cw')
                ], subtitles: 'Flutter')
              ]),
              RoadmapItem(title: 'React Native', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAx3kiplQR_oeDqLDBUDYwVv&si=iTwpBItE8d7yslok')
                ], subtitles: 'Java Script'),
                Subtitle(links: [
                  LinkData(
                      title: 'course Link',
                      url:
                          'https://www.udemy.com/course/the-complete-react-native-and-redux-course/?utm_source=adwords&utm_medium=udemyads&utm_campaign=LongTail_la.EN_cc.ROW&campaigntype=Search&portfolio=ROW-English&language=EN&product=Course&test=&audience=DSA&topic=&priority=&utm_content=deal4584&utm_term=_._ag_77879424134_._ad_535397245863_._kw__._de_c_._dm__._pl__._ti_dsa-1007766171312_._li_1005386_._pd__._&matchtype=&gad_source=1&gclid=CjwKCAjwyo60BhBiEiwAHmVLJTJ_X5NiKhAcyBqTAhN9ZT-s8XWX7PAszWOYd1CitnGD7GcPa3ZgGhoCrXQQAvD_BwE&couponCode=2021PM25')
                ], subtitles: 'ReactNative course')
              ]),
            ],
          ),
        ])
      ],
      image: 'assets/download (2).jpeg'),
  RoadmapSection(
      category: 'Backend development',
      sectionTitle: [
        Section(sectiontitle: 'Roadmap Topic', steps: [
          RoadmapStepData(title: 'Roadmap', items: [
            RoadmapItem(title: 'Backendroadmap', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Github Link',
                    url: 'https://github.com/PI-Space/Backend-Roadmap-2024')
              ], subtitles: 'Backendroadmap')
            ])
          ])
        ]),
        Section(sectiontitle: 'Basic', steps: [
          RoadmapStepData(
            title: 'Entry - Computer Science Essentials & Basics',
            items: [
              RoadmapItem(
                  title: 'Entry - Computer Science Essentials & Basics',
                  subtitle: [
                    Subtitle(links: [
                      LinkData(
                          title: 'video',
                          url:
                              'https://youtube.com/playlist?list=PL3X--QIIK-OHgMV2yBz3GLfM5d_5BxOSj&si=S90gmMVt02mksMLK')
                    ], subtitles: 'intro to cs')
                  ]),
              RoadmapItem(title: 'what is the bakend?', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Backend podcast',
                      url: 'https://youtu.be/lLMQ0vHAuuM?si=p7OW1-oYNsDxjBTN')
                ], subtitles: 'backend'),
              ]),
              RoadmapItem(
                title: 'Backend vs frontend',
                subtitle: [
                  Subtitle(links: [
                    LinkData(
                        title: 'Backend vs frontend',
                        url: 'https://youtu.be/vwvPFuh7ZDs?si=ACr-ZxVn_QtFkE07')
                  ], subtitles: 'Video'),
                ],
              ),
              RoadmapItem(
                title: 'Git & Github ',
                subtitle: [
                  Subtitle(links: [
                    LinkData(
                        title: 'Git & GitHub',
                        url:
                            'https://youtube.com/playlist?list=PLDoPjvoNmBAw4eOj58MZPakHjaO3frVMF&si=BNr_-AhuH8fh3NYU')
                  ], subtitles: 'Git&GitHub'),
                ],
              ),
              RoadmapItem(title: 'intro to oprating system', subtitle: [
                Subtitle(links: [
                  LinkData(title: 'Website 1', url: 'https://overthewire.org'),
                  LinkData(title: 'Website 2', url: 'https://linuxjourney.com'),
                ], subtitles: 'linux'),
              ]),
              RoadmapItem(title: "intro to Database", subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Videos',
                      url:
                          'https://youtube.com/playlist?list=PL37D52B7714788190&si=o4hHDa6Y_LhdKilp'),
                ], subtitles: 'DataBase'),
              ]),
            ],
          ),
          RoadmapStepData(
            title: 'Beginner General:',
            items: [
              RoadmapItem(title: "Frontend Basics", subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Videos',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAw_t_XWUFbBX-c9MafPk9ji&si=iHq1Y5rqK2hGc47D'),
                  LinkData(
                      title: 'Books',
                      url:
                          'https://books.google.com.eg/books?id=aGjaBTbT0o0C&printsec=copyright&redir_esc=y#v=onepage&q&f=false')
                ], subtitles: 'HTML'),
                Subtitle(links: [
                  LinkData(
                      title: 'Videos',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAzjsz06gkzlSrlev53MGIKe&si=pdtQYqKumppMY2jE'),
                  LinkData(
                      title: 'Books',
                      url:
                          'https://books.google.com.eg/books?id=aGjaBTbT0o0C&printsec=copyright&redir_esc=y#v=onepage&q&f=false')
                ], subtitles: 'CSS')
              ]),
              RoadmapItem(title: "intro to Web Development", subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Videos',
                      url: 'https://youtu.be/a1jSDxrb0tw?si=FjSf2S001b5SP6Lx'),
                ], subtitles: 'intro to Web'),
              ]),
            ],
          ),
          RoadmapStepData(
            title: 'Beginner & Intermediate Web Technologies:',
            items: [
              RoadmapItem(title: "Languages", subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'language videos Link',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAy41u35AqJUrI-H83DObUDq&si=ZeeU7ECFyFQbCStD'),
                  LinkData(
                      title: ' Laravel FramWork', url: 'https://laracasts.com/')
                ], subtitles: 'PhP'),
                Subtitle(links: [
                  LinkData(
                      title: 'language videos Link',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAx3kiplQR_oeDqLDBUDYwVv&si=WL619nXr4i7LtFiv'),
                  LinkData(
                      title: 'Node Js framework Link',
                      url: 'https://youtu.be/Oe421EPjeBE?si=-cFcsepj4yzQ_QXD')
                ], subtitles: 'Java script')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Advanced Topics", steps: [
          RoadmapStepData(title: 'Intermediate & Advanced General:', items: [
            RoadmapItem(title: 'Data Base', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAz6DT8SzQ1CODJTH-NIA7R9&si=yZhgcXGsA_vJ1JIc')
              ], subtitles: 'My SQL'),
              Subtitle(links: [
                LinkData(
                    title: 'Video Link',
                    url:
                        'https://youtube.com/playlist?list=PLesfn4TAj57XGGSmVzzpxY69-lha1EWEI&si=EBHZcA4sUA98Ooim')
              ], subtitles: 'MongoBD'),
              Subtitle(links: [
                LinkData(
                    title: ' Database problem solving',
                    url: 'https://www.hackerrank.com/domains/databases')
              ], subtitles: 'problem solving'),
            ]),
            RoadmapItem(title: 'Data Structure', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link',
                    url:
                        'https://youtube.com/playlist?list=PLCInYL3l2AajqOUW_2SwjWeMwf4vL4RSp&si=NSveKCp43kTUSM35')
              ], subtitles: 'My SQL'),
              Subtitle(links: [
                LinkData(
                    title: ' Database problem solving',
                    url: 'https://www.hackerrank.com/domains/data-structures')
              ], subtitles: 'problem solving'),
            ]),
            RoadmapItem(title: 'Docker', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link',
                    url: 'https://www.youtube.com/watch?v=fqMOX6JJhGo')
              ], subtitles: 'Docker'),
            ]),
            RoadmapItem(title: 'NetWorks', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link',
                    url:
                        'https://youtube.com/playlist?list=PLxbwE86jKRgMpuZuLBivzlM8s2Dk5lXBQ&si=SU1mwjPB4w9oVrV8')
              ], subtitles: 'NetWork playlist'),
            ]),
          ])
        ]),
      ],
      image: 'assets/images.jpeg'),
  RoadmapSection(
      category: 'Machine Learning',
      sectionTitle: [
        Section(sectiontitle: "Roadmap", steps: [
          RoadmapStepData(
            title: 'Machine Learning Roadmap',
            items: [
              RoadmapItem(title: 'Machine Learning Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Githup Link',
                      url:
                          'https://github.com/h9-tect/ML-DL_Roadmap./tree/main?fbclid=IwZXh0bgNhZW0CMTEAAR2aVetMTmRPPhu-ZIRgBeJ-IwUHFlaE4022N5XGAI92MosCwOePOr0S3lw_aem_lfZDDlhXTe_Xyljb1x6VwA')
                ], subtitles: 'Githup Link')
              ]),
            ],
          ),
        ])
      ],
      image: 'assets/WhatsApp Image 2024-06-29 at 22.46.34_5ea93309.jpg'),
  RoadmapSection(
      category: 'Cyber Security',
      sectionTitle: [
        Section(sectiontitle: "Roadmap", steps: [
          RoadmapStepData(
            title: 'cyber security Roadmap',
            items: [
              RoadmapItem(title: 'Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Road map Link',
                      url: 'https://roadmap.sh/cyber-security'),
                  LinkData(
                      title: 'VideoLink',
                      url: 'https://youtu.be/f3hP49LGoik?si=E99gAp3AQD-b5GNL')
                ], subtitles: 'Githup Link')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Basics", steps: [
          RoadmapStepData(
            title: 'What is cybersecurity',
            items: [
              RoadmapItem(title: 'What is Cybersecurity?', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url: 'https://youtu.be/Asxu8gO1Jt4?si=CufPKMxQgQmeg_iA')
                ], subtitles: 'Githup Link')
              ]),
              RoadmapItem(
                  title: 'IT Basics(comptiA(+A,+Network,+security))',
                  subtitle: [
                    Subtitle(links: [
                      LinkData(title: 'CISCo', url: ''),
                      LinkData(
                          title: 'Video Link',
                          url: 'https://www.youtube.com/@techvortexx/(CCNA)')
                    ], subtitles: 'Courses'),
                  ]),
              RoadmapItem(title: 'Oprating System', subtitle: [
                Subtitle(links: [
                  LinkData(title: 'website 1', url: 'https://linuxjourney.com'),
                  LinkData(title: 'WebSite 2', url: 'https://overthewire.org')
                ], subtitles: 'Linux'),
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Cyber Security Failds:", steps: [
          RoadmapStepData(
            title: 'Failds',
            items: [
              RoadmapItem(title: 'cybersecurity jobs :', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'VideoLink',
                      url:
                          'https://www.youtube.com/live/fzkHCqCJ0as?si=CfS8G66ByoRrROH2'),
                ], subtitles: 'Jobs'),
                Subtitle(links: [
                  LinkData(title: 'OSCP', url: ''),
                  LinkData(title: 'OSCE', url: ''),
                  LinkData(title: 'eWPT', url: ''),
                  LinkData(title: 'CEPT', url: ''),
                  LinkData(title: 'CRTP', url: ''),
                ], subtitles: 'Red Team certificates:'),
                Subtitle(links: [
                  LinkData(title: 'CISSP', url: ''),
                  LinkData(title: 'CISA', url: ''),
                  LinkData(title: 'CySA +', url: ''),
                ], subtitles: 'Blue Team certificates:'),
              ]),
            ],
          ),
        ]),
      ],
      image: 'assets/istockphoto-1334595508-612x612.jpg'),
  RoadmapSection(
      category: 'Data Analyst',
      sectionTitle: [
        Section(sectiontitle: "Roadmap", steps: [
          RoadmapStepData(
            title: 'Data Analyst Roadmap',
            items: [
              RoadmapItem(title: '  Data Analyst Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'roadmap Link',
                      url: 'https://roadmap.sh/data-analyst')
                ], subtitles: 'RoadMap')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Basics", steps: [
          RoadmapStepData(
            title: 'Data Analyst Basics',
            items: [
              RoadmapItem(title: 'Exel', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url:
                          'https://youtube.com/playlist?list=PLXlHqMRg9lAYiiutr-Ou0J1uU20T-5a4-&si=Rx-inSOJaSWplOIk')
                ], subtitles: 'Exel')
              ]),
              RoadmapItem(title: 'Programming Languages', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAyE_gei5d18qkfIe-Z8mocs&si=-Ga_xPh9He6WCOs2'),
                  LinkData(
                      title: 'Video Link 2',
                      url:
                          ' https://youtube.com/playlist?list=PLuXY3ddo_8nzrO74UeZQVZOb5-wIS6krJ&si=5Wct6xLweuzGpcEs'),
                ], subtitles: 'problem solving'),
                Subtitle(links: [
                  LinkData(
                      title: 'website1 Link',
                      url: 'https://www.hackerrank.com/domains/python'),
                  LinkData(
                      title: 'website2 Link',
                      url: 'https://leetcode.com/problemset/'),
                ], subtitles: 'problem solving'),
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAyE_gei5d18qkfIe-Z8mocs&si=-Ga_xPh9He6WCOs2'),
                  LinkData(
                      title: 'Book Link',
                      url: ' https://ehmatthes.github.io/pcc/'),
                ], subtitles: 'Books')
              ]),
              RoadmapItem(title: 'Database', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link',
                      url:
                          'https://youtube.com/playlist?list=PL37D52B7714788190&si=6cUkG4SAsK6XrR6Y')
                ], subtitles: 'DataBase')
              ]),
              RoadmapItem(title: 'Probability and statistics', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PL7snZ0LSsq3g9NUio7xFDtC9IVIj649GV&si=6XEHWpxN9rGhiFkW'),
                  LinkData(
                      title: 'Video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PL7snZ0LSsq3g6KzD6pdqwU3_Do8WPY4M8&si=yYaBpeALPzd9DLVm'),
                  LinkData(
                      title: 'Video Link 3',
                      url:
                          'https://youtube.com/playlist?list=PLxIvc-MGOs6gW9SgkmoxE5w9vQkID1_r-&si=SyBvtHjkcVIITgYs'),
                ], subtitles: 'DataBase')
              ]),
            ],
          ),
        ])
      ],
      image: 'assets/download (3).jpeg'),
  RoadmapSection(
      category: 'AI & DataScience',
      sectionTitle: [
        Section(sectiontitle: "Roadmap", steps: [
          RoadmapStepData(
            title: 'Ai & DataScience Roadmap',
            items: [
              RoadmapItem(title: 'Ai & DataScience Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'RoadMap Link',
                      url: 'https://roadmap.sh/ai-data-scientist')
                ], subtitles: 'RoadMap Link')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Mathmatics", steps: [
          RoadmapStepData(
            title: 'Linear',
            items: [
              RoadmapItem(title: 'Linear', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLxIvc-MGOs6iQXFnjF_STbhGdrZBphrv_&si=7tHkroT7p7fFwlJq'),
                  LinkData(
                      title: 'video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PL7snZ0LSsq3jRtNTG1lb6onCobD6sAqMQ&si=fNlNSfopRVlrWYOd'),
                  LinkData(
                      title: 'video Link 3',
                      url:
                          'https://youtube.com/playlist?list=PL7snZ0LSsq3gIc4bYM-OnvLZt2KpFvd2_&si=nzrtoEFVNGaQLWom'),
                  LinkData(
                      title: 'video Link 4',
                      url:
                          'https://youtube.com/playlist?list=PLvuToPs04FnD1lFBolGr4ROQaxQ_zyC1c&si=ZjT4J9Rau9Tv1eTx'),
                ], subtitles: 'Linear')
              ]),
            ],
          ),
          RoadmapStepData(
            title: 'Calculus',
            items: [
              RoadmapItem(title: 'Calculus', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLkZE9yPpQoVCnZA7kEBR27pT8tQR5mM8G&si=zOj3S_HkTsr_sLme'),
                  LinkData(
                      title: 'video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PLvuToPs04FnC4T14gDtl6CFNLUIv_EXjI&si=tdZ-JEh3ILYJ0NP8'),
                ], subtitles: 'Calculus')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Probability and statistics", steps: [
          RoadmapStepData(
            title: 'Probability and statistics',
            items: [
              RoadmapItem(title: 'Probability and statistics', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PL7snZ0LSsq3g9NUio7xFDtC9IVIj649GV&si=z9uLzuXv3h0yjsWt'),
                  LinkData(
                      title: 'video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PLxIvc-MGOs6gW9SgkmoxE5w9vQkID1_r-&si=ociMZkGb0tIlOv3H'),
                ], subtitles: 'probability and statistics')
              ]),
            ],
          ),
        ]),
      ],
      image: 'assets/1000_F_205110625_baTKpiTjtpRkL1UBdPaWN1nspkn7DPPf.jpg'),
  RoadmapSection(
      category: 'Web Development',
      sectionTitle: [
        Section(sectiontitle: "Roadmap Topic", steps: [
          RoadmapStepData(
            title: 'Web Development Roadmap',
            items: [
              RoadmapItem(title: 'Web Development Roadmap', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Roadmap Link',
                      url:
                          'https://powerslides.com/powerpoint-timelines/roadmap-templates/web-development-roadmap/')
                ], subtitles: 'Roadmap Link')
              ]),
            ],
          ),
        ]),
        Section(sectiontitle: "Languages", steps: [
          RoadmapStepData(
            title: 'Frontend Languages',
            items: [
              RoadmapItem(title: 'HTML & CSS', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAzHSjcR-HnW9tnxyuye8KbF&si=ElaKFWTm9zVuYv8W'),
                  LinkData(
                      title: 'Video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAy1l-2A21ng3gxEyocruT0t&si=WXJk82WVsYGgUoRM'),
                  LinkData(
                      title: 'Video Link 3',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAxuCSp2_-9LurPqRVwketnc&si=7iOZ309A4nbUHWkP'),
                  LinkData(
                      title: 'Video Link 4',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAyGaRGzPVZCkYx5L7Mo9Tbh&si=ponZcbAwmt-k8AZ-')
                ], subtitles: 'HTML & CSS videos')
              ]),
              RoadmapItem(title: 'Java Script', subtitle: [
                Subtitle(links: [
                  LinkData(
                      title: 'Video Link 1',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAw6p0z0Ek0OjPzeXoqlFlCh&si=tXCDaU8_CLLSV2lU'),
                  LinkData(
                      title: 'Video Link 2',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAx3kiplQR_oeDqLDBUDYwVv&si=6FltgPzKd3t_D3mH'),
                  LinkData(
                      title: 'Video Link 3',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAxhsMvDrXldKClH7FdE8WSf&si=Bp4dhm_Z1AkgimSd'),
                  LinkData(
                      title: 'Video Link 4',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAzLyvrWPwMw6bbBlTwPxgLF&si=hbl5rsURsfsv5Iof'),
                  LinkData(
                      title: 'Video Link 5',
                      url:
                          'https://youtube.com/playlist?list=PLDoPjvoNmBAwSrfBPERTnCmWAbcMAwG9O&si=xpdNMpg92lpsASA1'),
                ], subtitles: 'Java Script videos')
              ]),
            ],
          ),
          RoadmapStepData(title: 'Backend Languages', items: [
            RoadmapItem(title: 'PHP', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link 1',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAzH72MTPuAAaYfReraNlQgM&si=gNfXcLhfKNQGw8ur'),
                LinkData(
                    title: 'Video Link 2',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAwP0emFTIiCNcySKz-mlZj7&si=LkvfIjP4OJcTE-HQ'),
                LinkData(
                    title: 'Video Link 3',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAxXTPncg0W4lhVS32LO_xtQ&si=0COwPvm9dBXO68Cb'),
                LinkData(
                    title: 'Video Link 4',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAypWmEHEy3awR6Ek9sUe5ZS&si=VUs-mhatp0gADXCl'),
                LinkData(
                    title: 'Video Link 5',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAxAlZ-ss3Ss9XomXfm4FkmZ&si=774OlYqv4V3uqHoy'),
                LinkData(
                    title: 'Video Link 6',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAy41u35AqJUrI-H83DObUDq&si=dCdiDIUnPnd6josN')
              ], subtitles: 'PHP videos')
            ]),
            RoadmapItem(title: 'SQL', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link 1',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAz6DT8SzQ1CODJTH-NIA7R9&si=T3cXQd1V1CeW4535'),
              ], subtitles: 'SQL videos')
            ]),
            RoadmapItem(title: 'Python', subtitle: [
              Subtitle(links: [
                LinkData(
                    title: 'Video Link 1',
                    url:
                        'https://youtube.com/playlist?list=PLDoPjvoNmBAyE_gei5d18qkfIe-Z8mocs&si=DHN5knD8snI0kIo4'),
              ], subtitles: 'Python videos')
            ]),
          ])
        ])
      ],
      image: 'assets/WhatsApp Image 2024-06-29 at 22.46.34_a122cd09.jpg'),
];
