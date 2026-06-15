import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(useMaterial3: false),
      home: MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  final int _rowsPerPage =
      10; // Number of rows to be shown in each page of the datagrid.
  final double _dataPagerHeight = 60.0; // Height of the data pager widget.
  double pageCount = 0; // Total number of pages in the datagrid.

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
    final rowsCount = employees.length;
    pageCount = (rowsCount / _rowsPerPage)
        .ceil()
        .toDouble(); // Calculate total pages.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion Flutter DataGrid')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(child: buildDataGrid()),
              SizedBox(
                height: _dataPagerHeight, // Set the height of the data pager.
                child: SfDataPager(
                  delegate: employeeDataSource,
                  pageCount: pageCount,
                  direction: Axis.horizontal,
                  itemWidth: 100, // Set the width of each page number button.
                  navigationItemWidth:
                      100, // Set the width of the navigation buttons like "First" "Last" etc.
                  pageItemBuilder: (text) {
                    // ✅ Convert page number text → 4 digit (1001, 1002...)
                    int? pageNum = int.tryParse(text);

                    String displayText;
                    if (pageNum != null) {
                      displayText = (1000 + pageNum).toString();
                    } else {
                      // For navigation buttons like "First", "Last" etc., keep the original text.
                      displayText = text;
                    }

                    // Return the widget to be rendered for each page number and navigation button.
                    return Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          displayText,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDataGrid() {
    return SfDataGrid(
      source: employeeDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
          columnName: 'id',
          label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text('ID'),
          ),
        ),
        GridColumn(
          columnName: 'name',
          label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Name'),
          ),
        ),
        GridColumn(
          columnName: 'designation',
          label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Designation', overflow: TextOverflow.ellipsis),
          ),
        ),
        GridColumn(
          columnName: 'salary',
          label: Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('Salary'),
          ),
        ),
      ],
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000),

      Employee(10011, 'Ava', 'QA Engineer', 14000),
      Employee(10012, 'Noah', 'Developer', 16000),
      Employee(10013, 'Olivia', 'Scrum Master', 22000),
      Employee(10014, 'Liam', 'Developer', 15500),
      Employee(10015, 'Emma', 'UX Designer', 17000),
      Employee(10016, 'Mason', 'DevOps Engineer', 23000),
      Employee(10017, 'Sophia', 'Business Analyst', 21000),
      Employee(10018, 'Ethan', 'Developer', 16500),
      Employee(10019, 'Isabella', 'Product Owner', 28000),
      Employee(10020, 'Logan', 'Developer', 15800),

      Employee(10021, 'Mia', 'QA Lead', 19000),
      Employee(10022, 'Lucas', 'Developer', 16200),
      Employee(10023, 'Charlotte', 'HR', 18000),
      Employee(10024, 'Jackson', 'Support Engineer', 13500),
      Employee(10025, 'Amelia', 'Data Analyst', 20000),
      Employee(10026, 'Aiden', 'Developer', 16000),
      Employee(10027, 'Harper', 'Technical Writer', 14500),
      Employee(10028, 'Carter', 'Developer', 16800),
      Employee(10029, 'Evelyn', 'UI Designer', 17200),
      Employee(10030, 'Jayden', 'Developer', 15700),

      Employee(10031, 'Abigail', 'QA Engineer', 14100),
      Employee(10032, 'Grayson', 'Cloud Engineer', 24000),
      Employee(10033, 'Emily', 'Developer', 15900),
      Employee(10034, 'Elijah', 'Solution Architect', 35000),
      Employee(10035, 'Ella', 'Developer', 16100),
      Employee(10036, 'Sebastian', 'Developer', 16500),
      Employee(10037, 'Avery', 'Project Coordinator', 18500),
      Employee(10038, 'Jack', 'Developer', 16300),
      Employee(10039, 'Scarlett', 'QA Engineer', 14300),
      Employee(10040, 'Daniel', 'Developer', 16700),

      Employee(10041, 'Aria', 'Designer', 17100),
      Employee(10042, 'Matthew', 'Developer', 16600),
      Employee(10043, 'Chloe', 'Support Engineer', 13800),
      Employee(10044, 'David', 'Developer', 16400),
      Employee(10045, 'Grace', 'Business Analyst', 21200),
      Employee(10046, 'Joseph', 'Developer', 15600),
      Employee(10047, 'Victoria', 'QA Lead', 19200),
      Employee(10048, 'Samuel', 'Developer', 16900),
      Employee(10049, 'Lily', 'UX Researcher', 17800),
      Employee(10050, 'Andrew', 'Developer', 16000),
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                columnName: 'designation',
                value: e.designation,
              ),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
