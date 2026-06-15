# How-to-display-large-page-numbers-with-pagination-buttons-in-the-Flutter-SfDataPager

In this article, we will show you how to display large page numbers with pagination buttons in the [Flutter DataTable](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).


Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) and [SfDataPager](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataPager-class.html) widgets with all the required properties.
To display large page numbers with pagination buttons, you can use the [SfDataPager.itemWidth](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataPager/itemWidth.html) property. This property allows you to explicitly define the width of each page item, ensuring that larger page numbers (such as 3 or 4-digit values) are displayed properly without truncation or layout issues.

Note that this customization applies only to numeric page items. The width of navigation buttons, such as `First`, `Last`, `Next`, and `Previous`, can be modified using the [SfDataPager.navigationItemWidth](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataPager/navigationItemWidth.html) property.

```dart
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
```

You can download this example in [GitHub](https://github.com/SyncfusionExamples/How-to-display-large-page-numbers-with-pagination-buttons-in-the-Flutter-SfDataPager).