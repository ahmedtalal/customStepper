// class DynamicWidgetModel {
//   String? id;
//   String? title;
//   String? secondTitle;
//   List<Steps>? steps;
//   List<String>? actions;
//   String? layout;
//   List<List>? formData;
//
//   DynamicWidgetModel({this.id, this.title, this.secondTitle, this.steps, this.actions, this.layout, this.formData});
//
//   DynamicWidgetModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     secondTitle = json['secondTitle'];
//     if (json['steps'] != null) {
//       steps = <Steps>[];
//       json['steps'].forEach((v) { steps!.add(new Steps.fromJson(v)); });
//     }
//     actions = json['actions'].cast<String>();
//     layout = json['layout'];
//     if (json['formData'] != null) {
//       formData = <List>[];
//       json['formData'].forEach((v) { formData!.add(new List.fromJson(v)); });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = id;
//     data['title'] = title;
//     data['secondTitle'] = secondTitle;
//     if (steps != null) {
//       data['steps'] = steps!.map((v) => v.toJson()).toList();
//     }
//     data['actions'] = actions;
//     data['layout'] = layout;
//     if (formData != null) {
//       data['formData'] = formData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Steps {
//   String? label;
//   String? description;
//
//   Steps({this.label, this.description});
//
//   Steps.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     data['description'] = this.description;
//     return data;
//   }
// }
//
// class FormData {
//
//
//   FormData({});
//
// FormData.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }