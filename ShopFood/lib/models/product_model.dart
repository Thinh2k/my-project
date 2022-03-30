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
      name: '7-up',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1622766815178-641bef2b4630?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=919&q=80',
      price: 10000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Thùng 12 chai nước ngọt 7 Up vị chanh 1.5 lít',
    ),
    Product(
      name: 'Nước suối',
      category: 'Đồ uống',
      imageUrl:
      'https://media.istockphoto.com/photos/bottled-water-picture-id147046441?s=612x612',
      price: 5000,
      isRecommended: true,
      isPopular: true,
      informationProduct: 'Chai nước có nhiều kích cỡ 1.5L, 1L, 500ml, 300ml.',
    ),
    Product(
      name: 'Pepsi',
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
      name: 'CoCa-CoLa',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1629019416996-712aa1bd87f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 10000,
      isRecommended: true,
      isPopular: true,
      informationProduct: 'Coca-Cola Thùng 24 Lon Nước Ngọt Coca Cola 250Ml',
    ),
    Product(
      name: 'Red Bull',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1632858280935-d5611683e434?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 13000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Red Bull là loại nước uống tăng lực sở hữu bởi công ty Red Bull GmbH của Áo. ',
    ),
    Product(
      name: '1 Chai bia Heineken',
      category: 'Đồ uống',
      imageUrl:
      'https://images.unsplash.com/photo-1618885472179-5e474019f2a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 14500,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Bia Heineken nói chung là sản phẩm được yêu thích tại Việt Nam cho thấy qua sản lượng tiêu thụ bia rất là cao. Đối với sản phẩm bia Heineken chai cũng là một trong những sản phẩm được yêu thích sử dụng nhất.',
    ),

    // Thực phẩm đông lạnh
    Product(
      name: 'Thịt gà 1con',
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
    Product(
      name: '1kg Ghẹ (Loại 3-5 con/kg)',
      category: 'Thực phẩm đông lạnh',
      imageUrl:
      'https://media.istockphoto.com/photos/selective-focus-on-frozen-blue-crab-lying-on-ice-picture-id1316421823?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 200000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Ghẹ là một trong những món ăn bổ sung nhiều chất dinh dưỡng cho cơ thể và xương rất nhiều',
    ),

    //Rau củ quả
    Product(
      name: '1kg Carrot',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1445282768818-728615cc910a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 17000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cà rốt là một loại cây có củ, thường có màu đỏ, vàng, trắng hay tía. Phần ăn được của cà rốt là củ, thực chất là rễ cái của nó, chứa nhiều tiền tố của vitamin A tốt cho mắt.',
    ),
    Product(
      name: '1kg Cà Chua',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1561136594-7f68413baa99?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 5500,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cà chua là một loại rau quả làm thực phẩm. Quả ban đầu có màu xanh, chín ngả màu từ vàng đến đỏ. Cà chua có vị hơi chua và là một loại thực phẩm bổ dưỡng, tốt cho cơ thể, giàu vitamin C và A, đặc biệt là giàu lycopeme tốt cho sức khỏe.',
    ),
    Product(
      name: '1kg Ớt đỏ',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1526346698789-22fd84314424?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 25000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Ớt đỏ, loại gia vị cay quen thuộc, được dùng trong rất nhiều món ăn ở xứ ta.',
    ),
    Product(
      name: '1kg Tỏi',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1636210589096-a53d5dacd702?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 20000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Tỏi là một loài thực vật thuộc họ Hành, nghĩa là có họ hàng với hành tây, hành ta, hành tím, tỏi tây, v.v... và cũng được con người sử dụng làm gia vị, thuốc, rau như những loài họ hàng của nó. ',
    ),
    Product(
      name: '1kg SúpLơ',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmVnZXRhYmxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60', //https://unsplash.com/photos/kcYXj4tBtes
      price: 40000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Bông cải trắng hay còn gọi là súp lơ, hay su lơ, bắp su lơ, hoa lơ, cải hoa hay cải bông trắng là một loại cải ăn được, thuộc loài Brassica oleracea, họ Cải, mọc quanh năm, gieo giống bằng hạt. Phần sử dụng làm thực phẩm của súp lơ là toàn bộ phần hoa chưa nở, phần này rất mềm, xốp nên không chịu được mưa nắng.',
    ),
    Product(
      name: '1kg Đậu Que',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1567375698348-5d9d5ae99de0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 30000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Quả đậu non, hay đậu non, là quả đậu chưa chín, chưa tách vỏ và được thu hoạch khi chưa trưởng thành hay còn non của các giống cây trồng các loài đậu có vỏ Phaseolus vulgaris',
    ),
    Product(
      name: '1kg Ớt chuông',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1525607551316-4a8e16d1f9ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=410&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 61000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Ớt chuông, hay còn gọi là ớt ngọt, là quả của một nhóm cây trồng, loài Capsicum annuum. Cây trồng của loài này cho ra trái với màu sắc khác nhau, bao gồm màu đỏ, vàng, cam, xanh lục, sô-cô-la / nâu, vanilla / trắng, và màu tím. Ớt chuông đôi khi được xếp vào nhóm ớt ít cay mà cùng loại với ớt ngọt.',
    ),
    Product(
      name: '1kg Khoai tây',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1590165482129-1b8b27698780?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 40000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Khoai tây, thuộc họ Cà. Khoai tây là loài cây nông nghiệp ngắn ngày, trồng lấy củ chứa tinh bột. Chúng là loại cây trồng lấy củ rộng rãi nhất thế giới và là loại cây trồng phổ biến thứ tư về mặt sản lượng tươi – xếp sau lúa, lúa mì và ngô. Lưu trữ khoai tây dài ngày đòi hỏi bảo quản trong điều kiện lạnh',
    ),
    Product(
      name: '200g Gừng',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1615484478243-c94e896edbae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHZlZ2V0YWJsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60', //https://unsplash.com/photos/kcYXj4tBtes
      price: 30000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Gừng là một loài thực vật hay được dùng làm gia vị, thuốc.',
    ),
    Product(
      name: '1kg rau Xà lách',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1556843824-2a36847e3173?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 42000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Giá rau xà lách xanh hiện nay có giá trung bình từ 42 nghìn/ 1kg đây là loại rau được nhiều người yêu thích đặc biệt người dân Hà Nội',
    ),
    Product(
      name: '1kg Cải ngọt',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1511993226957-cd166aba52d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=398&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 20500,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cải ngọt là một loại rau chứa nhiều chất xơ, vị ngọt mát và có độ giòn thơm ngon. Cải ngọt do S1000Food phân phối được trồng hữu cơ, do đó, sản phẩm không chứa hóa chất độc hại, không thuốc kích thích tăng trưởng, đảm bảo an toàn vệ sinh thực phẩm. Cải ngọt có thể dùng làm nguyên liệu chế biến nhiều món ăn khác nhau như xào tỏi, nấu canh, xào thịt bò, xào nấm đông cô, sốt dầu hào… để thay đổi bữa ăn trong gia đình.',
    ),
    Product(
      name: '1kg Cà tím',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1601477572224-cb15a76f30f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 23000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Cà tím là một loài cây thuộc họ Cà với quả cùng tên gọi, nói chung được sử dụng làm một loại rau trong ẩm thực. Cà tím có quan hệ họ hàng gần gũi với cà chua, khoai tây, cà dừa, cà pháo và có nguồn gốc ở miền Nam Ấn Độ và Sri Lanka.',
    ),
    Product(
      name: '1kg Dưa chuột',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1589621316382-008455b857cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 16000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Dưa chuột là một cây trồng phổ biến trong họ bầu bí, là loại rau ăn quả thương mại quan trọng, nó được trồng lâu đời trên thế giới và trở thành thực phẩm của nhiều nước.',
    ),
    Product(
      name: '500g Rau Mồng tơi',
      category: 'Rau củ quả',
      imageUrl:
      'https://media.istockphoto.com/photos/macro-photography-of-fresh-spinach-concept-of-organic-food-picture-id906619122?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 14500,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Mồng tơi mát và mùa nè nóng nực nó được xem như thứ rau vua. Trong Đông y, mồng tơi có tính hàn, vị chua, không độc, đi vào 5 kinh tâm, tì, can, đại trường, tá tràng, giúp lợi tiểu, tán nhiệt, giải độc, làm đẹp da, trị rôm sảy, mụn nhọt.',
    ),
    Product(
      name: '200g Măng tây',
      category: 'Rau củ quả',
      imageUrl:
      'https://media.istockphoto.com/photos/macro-photography-of-fresh-spinach-concept-of-organic-food-picture-id906619122?s=612x612', //https://unsplash.com/photos/kcYXj4tBtes
      price: 28000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Măng tây là một loại thực vật dùng làm rau. Cây thảo có thân mọc ngầm trong đất, thường gọi là thân rễ. Thân rễ dày, mang nhiều rễ dài, đường kính 5-6mm, màu nâu sáng, xốp. Các thân đứng mọc trong không khí lởm chởm những vết sẹo của những nhánh đã rụng. ',
    ),
    Product(
      name: '500g Bí đỏ',
      category: 'Rau củ quả',
      imageUrl:
      'https://images.unsplash.com/photo-1509622905150-fa66d3906e09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTN8fHZlZ2V0YWJsZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60', //https://unsplash.com/photos/kcYXj4tBtes
      price: 8000,
      isRecommended: false,
      isPopular: false,
      informationProduct: 'Bí ngô hay bí đỏ là một loại cây dây thuộc chi Cucurbita, họ Bầu bí. Đây là tên thông dụng để chỉ các loại cây thuộc các loài: Cucurbita pepo, Cucurbita mixta, Cucurbita maxima, và Cucurbita moschata. Nguồn gốc của bí ngô chưa được xác định tuy nhiên nhiều người cho rằng bí ngô có nguồn gốc ở Bắc Mỹ.',
    ),
  ];
}
