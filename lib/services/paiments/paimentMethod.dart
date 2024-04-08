

// import 'package:supabase/supabase.dart';

// class PaymentService {
//   final SupabaseClient supabaseClient;

//   PaymentService({required this.supabaseClient});

//   Future<void> addPayment(String userId, double amount, String reservationId) async {
//     // Insérer les données dans la table des paiements
//     final response = await supabaseClient.from('payments').insert([
//       {
//         'user_id': userId,
//         'montant': amount,
//         'date_paiement': DateTime.now(),
//         'id_reservation': reservationId
//       }
//     ]).eq('user_id', 'montant', 'date_paiement', );

//     if (response.error != null) {
//       // Gérer l'erreur
//       print('Erreur lors de linsertion du paiement : ${response.error!.message}');
//     } else {
//       print('Paiement enregistré avec succès');
//     }
//   }
// }
