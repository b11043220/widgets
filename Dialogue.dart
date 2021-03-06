import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogueDemo extends StatefulWidget {
  @override
  _DialogueDemoState createState() => _DialogueDemoState();
}

class _DialogueDemoState extends State<DialogueDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogue Demo'),
        elevation: 0,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 100,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('AlertDialogue', style: TextStyle(color: Colors.white),),
            ),
            onTap: _showAlertDialogue,
          ),
          SizedBox(height: 20,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('CupertinoAlertDialog', style: TextStyle(color: Colors.white),),
            ),
            onTap: _showCupertinoAlertDialog,
          ),
          SizedBox(height: 20,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Text('GeneralDialogue', style: TextStyle(color: Colors.white),),
            ),
            onTap: _showGeneralDialogue,
          ),
          SizedBox(height: 20,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('CupertinoModalPopup', style: TextStyle(color: Colors.white),),
            ),
            onTap: _showCupertinoModalPopup,
          ),
          SizedBox(height: 20,),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Text('BottomSheet', style: TextStyle(color: Colors.white),),
            ),
            onTap: _showBottomSheet,
          )
        ],),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)
          )
      ),
      builder: (BuildContext context) {
        return new Container(
          height: 400.0,
        );
      },
    );
  }

  void _showCupertinoModalPopup() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('??????'),
          message: Text('???????????????????????????'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('??????'),
              onPressed: ()=> Navigator.pop(context),
              isDefaultAction: true,
            ),
            CupertinoActionSheetAction(
              child: Text('????????????'),
              onPressed: ()=> Navigator.pop(context),
              isDestructiveAction: true,
            ),
          ],
        );
      }
    );
  }

  void _showGeneralDialogue() {
    showGeneralDialog(
      context: context,
      barrierDismissible:true,
      barrierLabel: '',
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: Container(
            height: 300,
            width: 250,
            color: Colors.lightGreenAccent,
          ),
        );
      }
    );
  }

  void _showCupertinoAlertDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('??????'),
          content: Text('????????????????'),
          actions: [
            CupertinoDialogAction(
              child: Text('??????'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('??????'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  void _showAlertDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('??????'),
          content: Text('???????????????????'),
          actions: [
            _confirmView(),
            _cancelView()
          ],
        );
      }
    );
  }

  Widget _confirmView() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Text('??????', style: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _cancelView() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Text('??????', style: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
