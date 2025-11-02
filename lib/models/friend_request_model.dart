import 'package:cloud_firestore/cloud_firestore.dart';

enum FriendRequestStatus { pending, accepted, declined }

class FriendRequestModel {
  final String id;
  final String senderId;
  final String receiverId;
  final FriendRequestStatus status;
  final DateTime createdAt;
  final DateTime? respondedAt;
  final String? message;

  FriendRequestModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    this.status = FriendRequestStatus.pending,
    required this.createdAt,
    this.respondedAt,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      // 'status': status,
      'status': status.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'respondedAt': respondedAt?.millisecondsSinceEpoch,
      'message': message,
    };
  }

  static FriendRequestModel fromMap(Map<String, dynamic> map) {
    DateTime createdAt;
    if (map['createdAt'] is Timestamp) {
      createdAt = (map['createdAt'] as Timestamp).toDate();
    } else if (map['createdAt'] is int) {
      createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);
    } else {
      createdAt = DateTime.now();
    }

    // Handle respondedAt - can be either Timestamp, int, or null
    DateTime? respondedAt;
    if (map['respondedAt'] != null) {
      if (map['respondedAt'] is Timestamp) {
        respondedAt = (map['respondedAt'] as Timestamp).toDate();
      } else if (map['respondedAt'] is int) {
        respondedAt = DateTime.fromMillisecondsSinceEpoch(map['respondedAt']);
      }
    }

    return FriendRequestModel(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      status: FriendRequestStatus.values.firstWhere(
        (e) => e.name == map['status'],
        orElse: () => FriendRequestStatus.pending,
      ),
      createdAt: createdAt,
      respondedAt: respondedAt,
      // createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
      // respondedAt: map['respondedAt'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['respondedAt'])
      //     : null,
      message: map['message'],
    );
  }

  FriendRequestModel copyWith({
    String? id,
    String? senderId,
    String? receiverId,
    FriendRequestStatus? status,
    DateTime? createdAt,
    DateTime? respondedAt,
    String? message,
  }) {
    return FriendRequestModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      respondedAt: respondedAt ?? this.respondedAt,
      message: message ?? this.message,
    );
  }
}
