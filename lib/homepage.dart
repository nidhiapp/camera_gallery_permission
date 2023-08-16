import 'dart:io';

import 'package:camera_gallery_permission_assignment/lists.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamGalleryPermission extends StatefulWidget {
  const CamGalleryPermission({super.key});

  @override
  State<CamGalleryPermission> createState() => _CamGalleryPermissionState();
}

class _CamGalleryPermissionState extends State<CamGalleryPermission> {
  File? image;
  Future imagePickFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this.image = imageTemp;
    });
  }

  Future imagePickFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this.image = imageTemp;
    });
  }

  //from camera

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_outlined,
          size: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 43, 76, 93),
        title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 23, color: Colors.white),
            )),
      ),
      backgroundColor: const Color.fromARGB(255, 14, 49, 66),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Stack(children: [
                if (image == null)
                  CircleAvatar(
                      radius: 95,
                      backgroundImage: AssetImage(
                        'assets/images/Tiranga2.png',
                      ))
                else
                  CircleAvatar(
                    radius: 95,
                    backgroundImage: FileImage(image!),
                  ),
                Positioned(
                    bottom: 3,
                    right: 10,
                    child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 22, 187, 157),
                        radius: 28,
                        child: MaterialButton(
                            onPressed: () {
                              showModalBottomSheet(backgroundColor:  const Color.fromARGB(255, 43, 76, 93),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 270,
                                      // padding: EdgeInsets.only(top:25),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              height: 2,
                                              width: 50,
                                              color: const Color.fromARGB(255, 196, 209, 215),),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("Profile photo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                                              SizedBox(width:30),
                                              Icon(Icons.delete_forever_rounded,size: 30,color: Colors.blueGrey,)
                                            ],
                                          ),
                                          SizedBox(height: 30,),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  imagePickFromCamera();
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.blueGrey),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .camera_alt_rounded, color: const Color.fromARGB(255, 22, 187, 157),
                                                        size: 30,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("Camera",style: TextStyle(color: Colors.white,),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  imagePickFromGallery();
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.blueGrey),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .browse_gallery_rounded, color: const Color.fromARGB(255, 22, 187, 157),
                                                          size: 30,
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("Gallery",style: TextStyle(color: Colors.white)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.blueGrey),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 30,color:   const Color.fromARGB(255, 22, 187, 157),
                                                      )),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("Avatar",style: TextStyle(color: Colors.white)),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                              color: Colors.white,
                            ))))
              ]),
            ),
          ),
          const Details()
        ],
      ),
    );
  }
}
