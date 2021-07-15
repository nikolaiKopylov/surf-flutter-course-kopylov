import 'package:places/domain/sight.dart';

import 'domain/category.dart';
import 'domain/point.dart';
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
    type: filterList[2],
  ),
  Sight(
    name: 'Брестская крепость',
    lat: 52.085603,
    lon: 23.655606,
    url:
        'https://34travel.me/media/upload/images/2020/SEPTEMBER/brest-new/296A5725.jpg',
    details:
        'Мощное оборонительное сооружение и масштабный музей советской героической монументалистики под открытым небом. Сама крепость была построена в XIX веке, и история у нее впечатляющая. ',
    type: filterList[3],
  ),
  Sight(
    name: 'Беловежская пуща',
    lat: 52.5575,
    lon: 23.7964,
    url:
        'https://34travel.me/media/upload/images/2017/april/34_bel_dostoprim/new/IMG_6978.jpg',
    details:
        'Беларусский повод для гордости – самый большой и старый лесной массив Европы, охраняется ЮНЕСКО. Да, здесь в дикой природе водятся зубры. Да, на них можно даже охотится (если хватит совести). Да, это здесь подписали соглашение о развале СССР. ',
    type: filterList[3],
  ),
  Sight(
    name: 'Терриконы',
    lat: 52.7822910,
    lon: 27.5372246,
    url:
        'https://34travel.me/media/upload/images/2020/MAY/marshrut-luban/IMG_7526.jpg',
    details:
        'Солигорские терриконы вызывают восторг с любого расстояния: понимаешь, что здесь не может быть таких высоких объектов, но тихо радуешься. Горы все-таки есть. Их высота местами превышает 120 метров, белые верхушки словно присыпаны снегом, а внизу и вовсе какой-то иранский пейзаж. ',
    type: filterList[2],
  ),
  Sight(
    name: 'Парк Четырех Стихий',
    lat: 52.7822910,
    lon: 27.5372246,
    url:
        'https://vetliva.ru/upload/adwex.minified/webp/f09/90/f093cdf0fe8f115047fbc7f46586e021.webp',
    details:
        'Название парка отсылает к основной идее его создателя. Стихии, представленные разными архитектурными воплощениями, призваны символизировать единство природы и красоту всех ее состояний.',
    type: filterList[3],
  ),
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

final currentPoint = Point(lat: 52.78472, lon: 27.53500);

final List<String> photosList = [
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_55.jpg',
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_56.jpg',
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_57.jpg',
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_58.jpg',
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_59.jpg',
  'https://obgonay.ru/wp-content/uploads/krasivye-cifry-ot-1-do-10-dlya-detej-kartinki_60.jpg',
];
