import 'package:flutter/material.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customURlLaunch(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  //The controls of Text Editing
  TextEditingController nameTextControl = TextEditingController();
  // TextEditingController phoneTextControl = TextEditingController();
  TextEditingController messageTitleTextControl = TextEditingController();
  TextEditingController contentTextControl = TextEditingController();

  @override
  void dispose() {
    nameTextControl.dispose();
    // phoneTextControl.dispose();
    messageTitleTextControl.dispose();
    contentTextControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.whiteColor,
      appBar: AppBar(
        title: const Text('Contact Us', style: TextStyle(color: Colors.white)),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _contactUSCard(),
      ),
    );
  }

  Widget customTextField(
      String hitName, TextEditingController textEditingControl, int maxLine) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 8),
      child: TextField(
        maxLines: maxLine,
        controller: textEditingControl,
        decoration: InputDecoration(
          hoverColor: ToolsUtilities.secondColor,
          focusColor: ToolsUtilities.secondColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ToolsUtilities.mainColor),
          ),
          labelText: hitName,
          labelStyle: const TextStyle(color: ToolsUtilities.secondColor),
        ),
      ),
    );
  }

  Widget _contactUSCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ToolsUtilities.contactUsHeaderImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(0),
          ),
        ),

        //name Of our Company or Brand
        const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            top: 35,
            bottom: 20,
          ),
          child: Text(
            'We Are Happy To hear Your Review',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 18.0, top: 10),
        //   child: Text(
        //     ' ',
        //     style: TextStyle(color: ToolsUtilities.secondColor, fontSize: 15),
        //     textAlign: TextAlign.start,
        //   ),
        // ),
        customTextField('Enter Your Name', nameTextControl, 1),
        // customTextField('Enter Your Phone Number', phoneTextControl, 1),
        customTextField('Enter Your Message Title', messageTitleTextControl, 1),
        customTextField('Enter Your Message Content', contentTextControl, 4),

        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width * 0.65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: ToolsUtilities.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onPressed: () {},
              child: TextButton.icon(
                  onPressed: () {
                    //Call Us via email
                    var myEmail = ToolsUtilities.email;
                    String subject = messageTitleTextControl.text;
                    //My Phone Number is: ${phoneTextControl.text}\n
                    String body =
                        "My Name is :${nameTextControl.text}\n   ${contentTextControl.text}";
                    String mailUrl = Uri.encodeFull(
                        'mailto:$myEmail?subject=$subject&body=$body');
                    customURlLaunch(mailUrl);

                    nameTextControl.text = '';
                    // phoneTextControl.text = '';
                    messageTitleTextControl.text = '';
                    contentTextControl.text = '';
                  },
                  icon: const Icon(
                    Icons.email,
                    color: ToolsUtilities.whiteColor,
                  ),
                  label: const Text(
                    'Send Via Email',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: ToolsUtilities.whiteColor),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
