enum VerificationStatus { verified, pending, unverified }

class IdentityVerificationState {
  final VerificationStatus status;
  final String fullName;
  final String nationalId;
  final String documentType;
  final bool isFrontUploaded;
  final bool isBackUploaded;

  const IdentityVerificationState({
    this.status = VerificationStatus.verified,
    this.fullName = 'Ahmed El-Sayed',
    this.nationalId = '•••• •••• 9842',
    this.documentType = 'National ID',
    this.isFrontUploaded = true,
    this.isBackUploaded = true,
  });

  IdentityVerificationState copyWith({
    VerificationStatus? status,
    String? fullName,
    String? nationalId,
    String? documentType,
    bool? isFrontUploaded,
    bool? isBackUploaded,
  }) {
    return IdentityVerificationState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      nationalId: nationalId ?? this.nationalId,
      documentType: documentType ?? this.documentType,
      isFrontUploaded: isFrontUploaded ?? this.isFrontUploaded,
      isBackUploaded: isBackUploaded ?? this.isBackUploaded,
    );
  }
}
