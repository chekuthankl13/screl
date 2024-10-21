class FormModel {
  final String subject;
  final String preview;
  final String from;
  final String email;
  final bool oncePerCustomer;
  final bool customerAudience;

  const FormModel(
      {required this.subject,
      required this.preview,
      required this.from,
      required this.email,
      required this.oncePerCustomer,
      required this.customerAudience});

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
      subject: json['subject'] ?? "",
      preview: json['preview'] ?? "",
      from: json['from'] ?? "",
      email: json['email'] ?? "",
      oncePerCustomer: json['once_per_customer'] ?? "",
      customerAudience: json['customer_audience'] ?? "");

  Map<String, dynamic>? toJson() => {
        "subject": subject,
        "preview": preview,
        "from": from,
        "email": email,
        "once_per_customer": oncePerCustomer,
        "customer_audience": customerAudience
      };
}
