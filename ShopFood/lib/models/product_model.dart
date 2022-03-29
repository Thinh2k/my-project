import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{

  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String informationProduct;



  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.informationProduct,
});


  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
        informationProduct: snap['informationProduct'],
    );
    return product;
  }



  @override
  List<Object?> get props => [name, category, imageUrl, price, isRecommended, isPopular, informationProduct];


  static List<Product> products = [
    // Đồ uống
    Product(
      name: '1 lon 7-up',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1622766815178-641bef2b4630?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=919&q=80',
      price: 10000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thùng 12 chai nước ngọt 7 Up vị chanh 1.5 lít',
    ),
    Product(
      name: '1 lon Pepsi',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1629203851288-7ececa5f05c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      price: 10000,
      isRecommended: true,
      isPopular: true,
      informationProduct: 'Nước Ngọt Pepsi Không Calo 330ml Thùng 24 lon. Pepsi là một đồ uống giải khát có gas, lần đầu tiên được sản xuất bởi Bradham. ',
    ),
    Product(
      name: '1 lon Bia Tiger',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1633785586918-aecf1088218d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 15000,
      isRecommended: false,
      isPopular: false,
      informationProduct: '1/8 Thùng 24 lon bia Tiger 330ml. Đây là một loại rượu bia đóng chai với độ cồn nhẹ chiếm 5%. Bia Tiger là thương hiệu độc quyền hàng đầu của APB, được bán tại hơn 60 quốc gia trên toàn thế giới bao gồm Mỹ, Canada, Úc, New Zealand và nhiều nước khác ở Trung Đông, châu Âu, châu Á và Mỹ Latinh.',
    ),
    Product(
      name: '1 lon CoCa-CoLa',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1629019416996-712aa1bd87f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 10000,
      isRecommended: true,
      isPopular: true,
      informationProduct: 'Coca-Cola Thùng 24 Lon Nước Ngọt Coca Cola 250Ml',
    ),

    // Thực phẩm đông lạnh
    Product(
      name: '1 con Thịt gà',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://images.unsplash.com/photo-1587593810167-a84920ea0781?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 100000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thịt gà tươi sạch được đóng gói sẵn, đã qua kiểm dịch và đạt chứng nhân an toàn vệ sinh thực phẩm. Nhanh tay đặt ngay để nhận giá cực kỳ ưu đãi.',
    ),
    Product(
      name: '1kg Thịt lợn',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://images.unsplash.com/photo-1560781290-7dc94c0f8f4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 70000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thịt Nạc Heo Chỉ từ 70k - Thịt Heo Đông lạnh chất lượng',
    ),
    Product(
      name: '1kg Thịt bò',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://images.unsplash.com/photo-1603048297172-c92544798d5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 270000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thịt bò giúp duy trì cơ bắp – đúng vậy, trong thịt bò có một nguồn protein rất dồi dào, vì vậy nó giúp hình thành các cơ thêm ngày càng săn chắc và khỏe mạnh \nThịt bò giúp ngăn ngừa thiếu máu vì bản chất nó chứa rất nhiều sắt, giúp tuần hoàn máu và lưu thông khí huyết \nTăng khả năng miễn dịch, phục hồi cơ thể \nChống oxy các mô bị tổn thương\nGiúp giảm béo\nCung cấp năng lượng',
    ),
    Product(
      name: '1kg Tôm',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/large-frozen-headless-langoustine-prawns-in-a-package-picture-id1311601571?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 110000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Tôm đông lạnh là thực phẩm được rất nhiều chị em nội trợ lựa chọn cho gia đình. Nếu bạn đang muốn đổi món cho gia đình mà chưa biết xử lý thế nào với loại thực phẩm này, hãy cùng chúng tôi khám phá món ngon trong thực đơn hàng ngày nhé!',
    ),
    Product(
      name: '200g Cá hồi',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/fresh-salmon-fillet-in-plastic-packing-for-sell-in-supermarket-or-picture-id1210599135?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 110000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Với công nghệ cấp đông của nước ngoài, cá hồi được xử lý và cấp đông ở nhiệt độ -40°C thật nhanh và bảo quản ở nhiệt độ -18°C. Với cách xử lý này cá vẫn giữ được độ tươi, màu sắc, chất lượng của cá và bảo quản được lâu dài.',
    ),
    Product(
      name: '500g Cá thu (4-6con)',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/mackerel-fish-on-ice-picture-id155606540?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 64500,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cá thu  có phần thịt cá dai ngon, có vị ngọt tự nhiên nên rất ngon. Cá thu đông lạnh giúp bảo quản lâu hơn mà thịt cá vẫn chắc, không bở mà vẫn giữ nguyên vị đậm đà, là nguyên liệu nấu ăn không thể thiếu của nhiều gia đình.',
    ),
    Product(
      name: '500g Mực ống',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/frozen-squid-picture-id1386929253?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 112000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Mực ống là thực phẩm phổ biến với các bữa ăn hằng ngày, mực ống rất dễ nhận biết so với các loại mực khác bởi có phần vây đuôi được xuất phát từ giữa thân kéo dài xuống cuối thân hình thoi, có túi mực đen để bảo vệ mình phòng khi có kẻ thù tấn công. Bên cạnh đó mực ống có đặc điểm là thân dài, hình ống có 8 râu nhỏ và 2 xúc tu dài, da có nhiều đốm hồng, mắt to trong suốt.',
    ),
    Product(
      name: '1kg Cá Ngừ',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/nice-picture-id1167355257?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 150000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cá ngừ đại dương là loại cá lớn thuộc họ Cá bạc má, chủ yếu thuộc chi Thunnus, sinh sống ở vùng biển ấm, cách bờ độ 185 km trở ra. Ở Việt Nam, Cá ngừ đại dương là tên địa phương để chỉ loại cá ngừ mắt to và cá ngừ vây vàng.',
    ),
  ];
}
