import 'package:places/domain/sight.dart';

import 'domain/category.dart';
import 'ui/constants.dart';

/// Моковые даные для Sight
final List<Sight> mocks = [
  Sight(
    name: 'Мирский замок',
    lat: 53.451295,
    lon: 26.473257,
    url:
        'https://34travel.me/media/upload/images/2020/OCTOBER/34dstpr-new/296A1215.jpg',
    details:
        'Мирский замок, замково-парковый комплекс «Мир» — оборонительное укрепление и резиденция в городском посёлке Мир Кореличского района Гродненской области Белоруссии. Памятник архитектуры, внесён в список Всемирного наследия ЮНЕСКО',
    type: 'замок',
  ),
  Sight(
    name: 'Брестская крепость',
    lat: 52.085603,
    lon: 23.655606,
    url:
        'https://34travel.me/media/upload/images/2020/SEPTEMBER/brest-new/296A5725.jpg',
    details:
        'Мощное оборонительное сооружение и масштабный музей советской героической монументалистики под открытым небом. Сама крепость была построена в XIX веке, и история у нее впечатляющая. ',
    type: 'крепость',
  ),
  Sight(
    name: 'Беловежская пуща',
    lat: 52.5575,
    lon: 23.7964,
    url:
        'https://34travel.me/media/upload/images/2017/april/34_bel_dostoprim/new/IMG_6978.jpg',
    details:
        'Беларусский повод для гордости – самый большой и старый лесной массив Европы, охраняется ЮНЕСКО. Да, здесь в дикой природе водятся зубры. Да, на них можно даже охотится (если хватит совести). Да, это здесь подписали соглашение о развале СССР. ',
    type: 'заповедик',
  )
];

/// filterList - данные о фильтрах(категориях, для фильтрации)
const List<Category> filterList = const <Category>[
  const Category(
    name: 'hotel',
    title: 'Отель',
    icon: AppIcons.iconHotel,
  ),
  const Category(
    name: 'restourant',
    title: 'Ресторан',
    icon: AppIcons.iconRestourant,
  ),
  const Category(
    name: 'particular_place',
    title: 'Особое место',
    icon: AppIcons.iconParticularPlace,
  ),
  const Category(
    name: 'park',
    title: 'Парк',
    icon: AppIcons.iconPark,
  ),
  const Category(
    name: 'museum',
    title: 'Музей',
    icon: AppIcons.iconMuseum,
  ),
  const Category(
    name: 'cafe',
    title: 'Кафе',
    icon: AppIcons.iconCafe,
  ),
];
