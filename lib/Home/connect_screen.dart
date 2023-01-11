// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';
import 'package:heart_rate/widgets.dart';
import 'package:permission_handler/permission_handler.dart';



class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot)  {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return  FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.grey,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) :'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1,
        title: const Text('Find Devices',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    StreamBuilder<List<BluetoothDevice>>(
                      stream: Stream.periodic(const Duration(seconds: 2))
                          .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                      initialData: const [],
                      builder: (c, snapshot) => Column(
                        children: snapshot.data!
                            .map((d) => ListTile(
                          title: Text(d.name, style: TextStyle(color: Colors.white),),
                          subtitle: Text(d.id.toString(), style: TextStyle(color: Colors.white),),
                          trailing: StreamBuilder<BluetoothDeviceState>(
                            stream: d.state,
                            initialData: BluetoothDeviceState.disconnected,
                            builder: (c, snapshot) {
                              if (snapshot.data ==
                                  BluetoothDeviceState.connected) {
                                return ElevatedButton(
                                  child: const Text('OPEN'),
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DeviceScreen(device: d))),
                                );
                              }
                              return Text(snapshot.data.toString());
                            },
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                    StreamBuilder<List<ScanResult>>(
                      stream: FlutterBlue.instance.scanResults,
                      initialData:  [],
                      builder: (c, snapshot) => Column(
                        children: snapshot.data!
                            .map(
                              (r) => ScanResultTile(
                            result: r,
                            onTap: () => Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              r.device.connect();
                              return DeviceScreen(device: r.device);
                            })),
                          ),
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
             /* const Positioned(
                left: 10,
                bottom: 10,
                child: Text('Version 1.0'),
              )*/
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: const Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
              backgroundColor: Colors.pink,
                child: const Icon(Icons.search,color: Colors.black,),
                onPressed: () => FlutterBlue.instance
                    .startScan(timeout: const Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}

class DeviceScreen extends StatefulWidget {

  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState(device: device);
}

class _DeviceScreenState extends State<DeviceScreen> {

  static String characteristicUuid = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";

  static List<DataClass> baseData1 = [];
  static List<DataClass> baseData2 = [];
 /*
  static List<DataClass> baseData3 = [];*/
  static List<List<dynamic>> recordedData = [];

  late double? graph1;
  late double? graph2;
  /*late double? graph2;
  late double? graph3;*/

  late int? timestamp;
  final int sizeofArray = 60;
  static int x = 0;
  static int X = 0;
  static int Y = 0;
  bool _canShowStoreButton = true;


  _DeviceScreenState({required this.device});

  final BluetoothDevice device;

  void changeButtons() async {
    setState(() {
      _canShowStoreButton = !_canShowStoreButton;
    });
    if(_canShowStoreButton){
      var status = await Permission.storage.status;
      if(status.isGranted){
        String csv = const ListToCsvConverter().convert(recordedData);
        Directory dir = Directory('/storage/emulated/0/Nami ECG/');
        if(!await dir.exists()){
          await dir.create(recursive: true);
        }
        /*Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;*/
        final String path = '/storage/emulated/0/Nami ECG/csv-${DateTime.now()}.csv';
        final File file = File(path);
        await file.writeAsString(csv);
      }else{
        openAppSettings();
      }
      recordedData = [[]];
    }
  }

  _getNewDataSet() {
    if(!_canShowStoreButton){
      List csvData = [
        X,
        graph1!,
        graph2!,
        /*graph3,*/
        timestamp
      ];
      recordedData.add(csvData);
    }

    //For Graph 1
    List<DataClass> currentDataSet = baseData1;
    DataClass temp = DataClass(yAxis: graph1!, xAxis: X);
    currentDataSet.add(temp);
    if(currentDataSet.length >= sizeofArray){
      for(int i = 0; i <= currentDataSet.length - sizeofArray; i++){
        currentDataSet.removeAt(i);
      }
    }
    baseData1 = currentDataSet;
    //For Graph 2
    currentDataSet = baseData2;
    temp = DataClass(yAxis: graph2!, xAxis: X);
    currentDataSet.add(temp);
    if(currentDataSet.length >= sizeofArray){
      for(int i = 0; i <= currentDataSet.length - sizeofArray; i++){
        currentDataSet.removeAt(i);
      }
    }
    baseData2 = currentDataSet;
    //For Graph 3
    /*currentDataSet = baseData3;
    temp = DataClass(yAxis: graph3!, xAxis: X);
    currentDataSet.add(temp);
    if(currentDataSet.length >= sizeofArray){
      for(int i = 0; i <= currentDataSet.length - sizeofArray; i++){
        currentDataSet.removeAt(i);
      }
    }
    baseData3 = currentDataSet;*/
  }

  void _dataParser(ECGString){
    X++;
   /* var temp = int.parse(ECGString.length.toString()*//*ECGString[3].toRadixString(16).padLeft(2, '0')+ECGString[2].toRadixString(16).padLeft(2, '0')+ECGString[1].toRadixString(16).padLeft(2, '0')+ECGString[0].toRadixString(16).padLeft(2, '0'), radix: 16*//*);
    X = temp;*/
    var temp = int.parse(ECGString.length.toString()/*ECGString[5].toRadixString(16).padLeft(2, '0')+ECGString[4].toRadixString(16).padLeft(2, '0')+ECGString[3].toRadixString(16).padLeft(2, '0')+ECGString[2].toRadixString(16).padLeft(2, '0'), radix: 16*/);
    graph1 = temp.toDouble();

    graph2 = temp.toDouble();
    temp = int.parse(ECGString.length.toString());

    timestamp = X++;
  /*  temp = int.parse(ECGString.toString()*//*ECGString[11].toRadixString(16).padLeft(2, '0')+ECGString[10].toRadixString(16).padLeft(2, '0')+ECGString[9].toRadixString(16).padLeft(2, '0')+ECGString[8].toRadixString(16).padLeft(2, '0'), radix: 16*//*);
    *//*graph2 = temp.toDouble();
    temp = int.parse(dataFromDevice[15].toRadixString(16).padLeft(2, '0')+dataFromDevice[14].toRadixString(16).padLeft(2, '0')+dataFromDevice[13].toRadixString(16).padLeft(2, '0')+dataFromDevice[12].toRadixString(16).padLeft(2, '0'), radix: 16);
    graph3 = temp.toDouble();
    temp = int.parse(dataFromDevice[19].toRadixString(16).padLeft(2, '0')+dataFromDevice[18].toRadixString(16).padLeft(2, '0')+dataFromDevice[17].toRadixString(16).padLeft(2, '0')+dataFromDevice[16].toRadixString(16).padLeft(2, '0'), radix: 16);*//*
    timestamp = temp;*/
  }

  Widget _myService(BuildContext context, List<BluetoothService> services){
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height / 4  ;
    Stream<List<int>>? stream;

    services.forEach((service) {
      service.characteristics.forEach((character) {
        if(character.uuid.toString() == characteristicUuid){
          character.setNotifyValue(!character.isNotifying);
          stream = character.value;
        }
      });
    });

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          StreamBuilder(stream: stream, builder: (c, snapshot){
            if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            if(snapshot.connectionState == ConnectionState.active){
              var currentValue = snapshot.data;
              _dataParser(currentValue);
              _getNewDataSet();
              return Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Heart Rate", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                    Container(
                      /*margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                      padding: EdgeInsets.only(top: 10),*/
                      width: width,
                      height: height,
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          LineSeries<DataClass, int>(
                              dataSource: baseData2,
                              xValueMapper: (DataClass graph, _) => graph.xAxis,
                              yValueMapper: (DataClass graph, _) => graph.yAxis,
                              color: Colors.green
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    Container(
                      child: Text("ECG Lead 1", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                    Container(
                     /* margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
                      padding: EdgeInsets.only(top: 10),*/
                      color: Colors.black,
                      /*color: Color(0xff1c1c1e),*/
                      width: width,
                      height: height,
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          LineSeries<DataClass, int>(
                              dataSource: baseData1,
                              xValueMapper: (DataClass graph, _) => graph.xAxis,
                              yValueMapper: (DataClass graph, _) => graph.yAxis,
                            color: Colors.pink,
                          ),

                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),

                    /*
                    Container(
                      width: width,
                      height: height,
                      child: SfCartesianChart(
                        series: <ChartSeries>[
                          LineSeries<DataClass, int>(
                              dataSource: baseData3,
                              xValueMapper: (DataClass graph, _) => graph.xAxis,
                              yValueMapper: (DataClass graph, _) => graph.yAxis,
                              color: Colors.red
                          )
                        ],
                      ),
                    ),*/
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50, width:120,
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                              color: Colors.pink),
                          child: Center(
                            child: Text("Record", style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 50, width:120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink),
                              child: Center(
                                child: Text("Save", style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 50, width:120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink),
                              child: Center(
                                child: Text("Stop", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                   /* _canShowStoreButton
                        ? ElevatedButton(
                        onPressed: () {
                          changeButtons();
                        },
                        child: const Text('Record Data')
                    )
                        : ElevatedButton(
                        onPressed: () {
                          changeButtons();
                        },
                        child: const Text('Stop')
                    )*/
                  ],
                ),
              );
            }else{
              return const Text('Check the Stream', style: TextStyle(color: Colors.white),);
            }
          }),
         /* const Positioned(
            left: 10,
            bottom: 10,
            child: Text('Version 1.0'),
          )*/
        ],
      ),
    );
  }

  // List<int> _getRandomBytes() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: widget.device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => widget.device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => widget.device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: widget.device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? const Icon(Icons.bluetooth_connected, color: Colors.white,)
                    : const Icon(Icons.bluetooth_disabled, color: Colors.grey,),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.', style: TextStyle(color: Colors.white),),
                subtitle: Text('${widget.device.id}'),
                trailing: StreamBuilder<bool>(
                  stream: widget.device.isDiscoveringServices,
                  initialData: false,
                  builder: (c, snapshot) => IndexedStack(
                    index: snapshot.data! ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh, color: Colors.white,),
                        onPressed: () => widget.device.discoverServices(),
                      ),
                      const IconButton(
                        icon: SizedBox(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                          width: 18.0,
                          height: 18.0,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff1c1c1e),
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
              child: Row(
                children: [
                  Image.asset("assets/heart.png", height: 40,),
                 SizedBox(width: 5,),
                 Container(padding: EdgeInsets.only(right: 5),
                   child: Text("79",
                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)
                   ),
                 ),
                  Text("bpm", style: TextStyle(fontSize: 14, color: Colors.white),)
                ],
              ),
            ),
            /*StreamBuilder<int>(
              stream: device.mtu,
              initialData: 0,
              builder: (c, snapshot) => ListTile(
                title: Text('MTU Size'),
                subtitle: Text('${snapshot.data} bytes'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => device.requestMtu(223),
                ),
              ),
            ),*/
            StreamBuilder<List<BluetoothService>>(
              stream: widget.device.services,
              initialData: const [],
              builder: (c, snapshot) {
                return _myService(context, snapshot.data!);
                // return Column(
                //   children: _buildServiceTiles(snapshot.data!),
                // );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class DataClass{
  late double yAxis;
  late int xAxis;

  DataClass({required this.yAxis, required this.xAxis});
}