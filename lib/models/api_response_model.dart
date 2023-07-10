class ApiResponseModel {
  final String status;
  final String message;
  final dynamic data;

  ApiResponseModel({required this.status, required this.message, this.data});

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
        status: json['status'], message: json['message'], data: json['data']);
  }
}
