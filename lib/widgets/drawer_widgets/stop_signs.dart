// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
// import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
// import 'package:provider/provider.dart';

// class StopSigns extends StatelessWidget {
//   const StopSigns({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<providerBrightness>(
//       builder: (context, brightness, child) {
//         return Scaffold(
//           backgroundColor: brightness.isDark ? blackColor : Colors.white,
//           appBar: AppBar(
//             backgroundColor: brightness.isDark ? blackColor : Colors.green,
//             iconTheme: const IconThemeData(
//               size: 30,
//               color: Colors.white,
//             ),
//             centerTitle: true,
//             title: const Text(
//               'علامات الوقف',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             actions: const [
//               Padding(
//                 padding: EdgeInsets.only(right: 15),
//                 child: Icon(
//                   FontAwesomeIcons.bookOpen,
//                 ),
//               ),
//             ],
//             elevation: 0,
//           ),
//           body: Column(
//             children: [
//               const SizedBox(height: 10),
//               const Text(
//                 'عَلامَاتِ الْوَقْفِ فِي الْمُصْحَفِ الشَّرِيفِ',
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: StopSignsList.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 15),
//                           child: Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: brightness.isDark
//                                   ? Colors.black
//                                   : Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Text(
//                               textAlign: TextAlign.justify,
//                               textDirection: TextDirection.rtl,
//                               StopSignsList[index]['text'],
//                               style: TextStyle(
//                                 fontSize: 23,
//                                 fontWeight: FontWeight.bold,
//                                 color: brightness.isDark
//                                     ? Colors.white
//                                     : blackColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Divider(
//                           color:
//                               brightness.isDark ? Colors.white : Colors.black,
//                           thickness: 2.5,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';

class StopSigns extends StatelessWidget {
  const StopSigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        bool isDark = brightness.isDark;
        Color backgroundColor = isDark ? blackColor : Colors.white;
        Color textColor = isDark ? Colors.white : blackColor;
        Color cardColor = isDark ? Colors.grey[900]! : Colors.white;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: isDark ? blackColor : Colors.green,
            iconTheme: const IconThemeData(
              size: 30,
              color: Colors.white,
            ),
            centerTitle: true,
            title: const Text(
              'علامات الوقف',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(FontAwesomeIcons.bookOpen),
              ),
            ],
            elevation: 2,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'عَلامَاتِ الْوَقْفِ فِي الْمُصْحَفِ الشَّرِيفِ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: StopSignsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Card(
                        color: cardColor,
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StopSignsList[index]['text'],
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Map> StopSignsList = [
  {
    "text":
        "م: تعني لزوم الوقف، كقوله -تعالى-: (إِنَّمَا يَسْتَجِيبُ الَّذِينَ يَسْمَعُونَ وَالْمَوْتَى يَبْعَثُهُمُ اللَّهُ)، فهنا يجب الوقوف على كلمة يسمعون."
  },
  {
    "text":
        "لا : وتعني الوقف الممنوع، أو النهي عن الوقف، كقوله -تعالى-: (الَّذِينَ تَتَوَفَّاهُمُ الْمَلَائِكَةُ طَيِّبِينَ يَقُولُونَ سَلامُ عَلَيْكُمُ ادْخُلُوا الْجَنَّةَ)، فهنا يُمنع الوقوف على كلمة طيبين."
  },
  {
    "text":
        "ج: وتعني أن القارئ يجوز له الوقف والوصل، كقوله تعالى: (نَحْنُ نَقُصُّ عَلَيْكَ نَبَأَهُمْ بِالْحَقِّ إِنَّهُمْ فِتْيَةٌ آمَنُوا بِرَبِّهِمْ) [٥] فهنا يجوز الوقف على كلمة بالحق، ويجوز عدم الوقوف عليها أو ما يُسمّى بالوصل."
  },
  {
    "text":
        "صلي أو صلى: وتعني أن القارئ يجوز له الوقف مع كون الوصل أفضل وأولى، كقوله -تعالى-: (وَإِنْ يَمْسَسْكَ اللَّهُ بِضَرٍّ فَلَا كَاشِفَ لَهُ إِلَّا هُوَ وَإِنْ يَمْسَسْكَ بِخَيْرٍ فَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ) ، [٦] فهنا يجوز الوقف على كلمة له مع أن عدم الوقف أي الوصل أفضل."
  },
  {
    "text":
        "قلي أو قلى: وتعني أن القارئ يجوز له الوصل مع أن الوقف أفضل وأولى، كقوله تعالى: (قُلْ رَبِّي أَعْلَمُ بِعِدَّتِهِمْ مَا يَعْلَمُهُمْ إِلَّا قَلِيلٌ فَلَا تُمَارِ فِيهِمْ) [٧] فهنا يجوز عدم الوقف على كلمة قليل، مع أن الوقف عليها أولى وأفضل."
  },
  {
    "text":
        "ثلاث نقاط مثلثة: وتسمى هذه بعلامة التعانق؛ وتعني أنه إذا وقف القارئ على إحداهما يصل الأخرى ولا يقف عليها، كقوله تعالى: (ذَلِكَ الْكِتَابُ لَا رَيْبَ . فِيهِ هُدًى لِلْمُتَّقِينَ) [۸] فهنا إذا وقف القارئ على كلمة ريب لا يجوز له الوقف على كلمة فيه، والعكس كذلك."
  },
  {
    "text":
        "ويحتاج القارئ إلى علامات الوقف لتقسيم الآيات، وليختار الوقف المناسب لإتمام المعنى، وقد كانت المصاحف في بدايتها تخلو من علامات الوقف، ثمّ قام العلماء بعد ذلك بوضع علامات الوقف والإشارة إليها برموز لها معنى خاص، وللوقف ستُ علامات، وقد يجد القارئ بعض الاختلاف في علامات الوقف بحسب الرواية المطبوع بها المصحف."
  },
  // {"text": "الوقف في القرآن الكريم"},
  // {"text": "تعريف الوقف وحكمه"},
  {
    "text":
        "يُعرف الوقف في اللغة بالكف والحبس، وأما في التجويد: فهو قطع الصوت عن آخر كلمة وقتاً؛ ليتنفس القارئ خلاله، بنية إعادة القراءة، ولا يكون في وسط الكلمة، وحكمه الجواز، ما لم يوجد مانع كأن يؤدي إلى تغيير المعنى المُراد ، [۱۲] ويُقدر وقت الوقف بمقدار الحركتين، ويكون في رؤوس الآيات، أو وسطها، ولا يجوز في وسط الكلمات، أو ما كان متصلاً رسماً ككلمة:"
  },
  // {"text": "أنواع الوقف"},
  {"text": "إن للوقف العديد من الأنواع، وبيانها فيما يأتي:"},
  {
    "text":
        "الوقف الاختباري: وهو أن يقف القارئ على كلمة لا تصلح للوقف، ويكون ذلك من المعلم بقصد اختبار تلميذه في حكم الكلمة من حيث القطع أو الوصل أو الإثبات أو الحذف، وغير ذلك من الأحكام، وحكمه الجواز ما دام في مقام الاختبار أو التعليم فقط."
  },
  {
    "text":
        "الوقف الانتظاري: وهو أن يقف القارئ على الكلمة القرآنية التي لها أكثر من وجه في القراءة؛ ليعطف عليها غيرها، وسمّي بذلك؛ لأن المعلم ينتظر التلميذ للإتيان بجميع الأوجه أو الروايات المتعلقة بالكلمة، وحكمه الجواز؛ حتى وإن لم يتم المعنى."
  },
  {
    "text":
        "الوقف الاضطراري: وهو أن يقف القارئ على كلمة ليست محلاً للوقف بسبب ظرف ألجأه للوقف، كضيق التنفس، أو السعال، وغير ذلك، وحكمه الجواز حتى انتهاء الضرورة، بشرط أن يعود القارئ إلى الكلمة التي وقف عليها فيصلها بما بعدها إن صلح الابتداء بها، وإلا يعود إلى ما قبلها."
  },
  {
    "text":
        "الوقف الاختياري: وهو أن يقف القارئ على الكلمة القرآنية بمحض إرادته، ويُشترط فيه الوقوف على كلام تام المعنى، وحكمه الجواز؛ إلا إذا كان فيه تغيير للمعنى، أو فهم منه معنى غير المعنى المقصود، ويكون هذا الوقف مقصوداً لذاته من غير أسباب."
  },
  // {"text": "أهمية الوقف"},
  {"text": "إن للوقف أهمية وفوائد عدة، ومنها ما يأتي:"},
  {
    "text":
        "معرفة معاني القرآن أثناء قراءته، واستنباط الأدلة الشرعية، ومعرفة الحلال والحرام والأوامر والنواهي."
  },
  {"text": "معرفة القارئ دلالة ودرجات الوقوف؛ مما يُشعر بفهمه للقرآن."},
];
