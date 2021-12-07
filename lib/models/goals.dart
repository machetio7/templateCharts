class GoalModal {
  bool estatus;
  final String descripcion;

  GoalModal({required this.estatus, required this.descripcion});

  factory GoalModal.fromJson(Map<String, dynamic> json) => GoalModal(
        estatus: json['estatus'] ?? false,
        descripcion: json['descripcion'] ?? "",
      );
}
