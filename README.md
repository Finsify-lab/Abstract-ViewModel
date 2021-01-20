# Abstract-ViewModel
Abstract viewmodel để tạo logic riêng cho trang Add/Edit dùng chung view

Sử dụng protocol ViewModelType. Tầng View sẽ chỉ giao tiếp với protocol này.

### Có 2 implementation của ViewModelType là:
 - TransactionAddingViewModel: xử lý logic cho việc add transaction.
 - TransactionEditingViewModel: xử lý logic cho việc edit transaction.
