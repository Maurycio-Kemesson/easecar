import 'package:easecar/core/conts/icons.dart';

import '../../../domain/enuns/store_type_enum.dart';
import '../../../domain/enuns/vehicle_condition_enum.dart';
import '../../../domain/enuns/vehicle_status_enum.dart';
import '../../models/brand_model.dart';
import '../../models/feedback_model.dart';
import '../../models/vehicle_model.dart';
import '../home_datasource.dart';

class HomeDatasourceImp implements HomeDatasource {
  @override
  Future<List<BrandModel>> fetchBrands() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
      BrandModel(name: 'Fiat', image: AppIcons.fiat),
      BrandModel(name: 'Ford', image: AppIcons.ford),
      BrandModel(name: 'Citroen', image: AppIcons.citroen),
      BrandModel(name: 'Honda', image: AppIcons.honda),
    ];
  }

  @override
  Future<List<VehicleModel>> fetchNewVehicles() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      VehicleModel(
        id: '1',
        model: 'Honda Civic 2024',
        km: 0,
        color: 'Prata',
        oldValue: 120000.00,
        newValue: 115000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        condition: VehicleConditionEnum.newVehicle,
        brand: BrandModel(name: 'Honda', image: AppIcons.honda),
        year: 2024,
        gearbox: 'Automático',
        doors: 4,
        fuel: 'Gasolina',
        armored: false,
        items: ['Airbags', 'Rodas de liga leve', 'Ar condicionado'],
        about: '',
      ),
      VehicleModel(
        id: '4',
        model: 'Ford Ranger 2024',
        km: 0,
        color: 'Prata London',
        oldValue: 199990.00,
        newValue: 189990.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        condition: VehicleConditionEnum.newVehicle,
        brand: BrandModel(name: 'Ford', image: AppIcons.ford),
        year: 2024,
        gearbox: 'Automático',
        doors: 4,
        fuel: 'Diesel',
        armored: false,
        items: ['Trava elétrica', 'Ar condicionado', 'Câmera de ré'],
        about: '',
      ),
      VehicleModel(
        id: '1',
        model: 'Citroën C3 2024',
        km: 0,
        color: 'Branco Perolizado',
        oldValue: 79990.00,
        newValue: 76990.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        condition: VehicleConditionEnum.newVehicle,
        brand: BrandModel(name: 'Citroen', image: AppIcons.citroen),
        year: 2024,
        gearbox: 'Manual',
        doors: 4,
        fuel: 'Gasolina',
        armored: false,
        items: ['Rádio', 'Ar condicionado'],
        about: '',
      ),
      VehicleModel(
        id: '4',
        model: 'Hyundai Creta 2024',
        km: 0,
        color: 'Branco',
        oldValue: 95000.00,
        newValue: 92000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        condition: VehicleConditionEnum.newVehicle,
        brand: BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
        year: 2024,
        gearbox: 'Automático',
        doors: 4,
        fuel: 'Gasolina',
        armored: false,
        items: ['Sensor de estacionamento', 'Câmera de ré'],
        about: '',
      ),
      VehicleModel(
        id: '5',
        model: 'Ford Ecosport 2024',
        km: 0,
        color: 'Azul',
        oldValue: 85000.00,
        newValue: 83000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.rejected,
        condition: VehicleConditionEnum.newVehicle,
        brand: BrandModel(name: 'Ford', image: AppIcons.ford),
        year: 2024,
        gearbox: 'Automático',
        doors: 4,
        fuel: 'Flex',
        armored: false,
        items: ['Ar condicionado', 'Rodas de liga leve', 'Central multimídia'],
        about: '',
      ),
    ];
  }

  @override
  Future<List<VehicleModel>> fetchUsedVehicles() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      VehicleModel(
        id: '1',
        model: 'HB20 2017',
        km: 50000,
        color: 'Branco',
        oldValue: 15000.00,
        newValue: 13000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        condition: VehicleConditionEnum.usedVehicle,
        brand: BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
        year: 2017,
        gearbox: 'Manual',
        doors: 4,
        fuel: 'Flex',
        armored: false,
        items: ['Airbags', 'Ar condicionado'],
        about: '',
      ),
      VehicleModel(
        id: '2',
        model: 'Punto 2010',
        km: 30000,
        color: 'Preto',
        oldValue: 35000.00,
        newValue: 32000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.underReview,
        condition: VehicleConditionEnum.usedVehicle,
        brand: BrandModel(name: 'Fiat', image: AppIcons.fiat),
        year: 2010,
        gearbox: 'Manual',
        doors: 4,
        fuel: 'Gasolina',
        armored: false,
        items: ['Ar condicionado', 'Rádio'],
        about: '',
      ),
      VehicleModel(
        id: '3',
        model: 'Fiat Uno 2020',
        km: 10000,
        color: 'Branco',
        oldValue: 45000.00,
        newValue: 43000.00,
        city: 'Caucaia',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.rejected,
        condition: VehicleConditionEnum.usedVehicle,
        brand: BrandModel(name: 'Fiat', image: AppIcons.fiat),
        year: 2020,
        gearbox: 'Automático',
        doors: 4,
        fuel: 'Flex',
        armored: false,
        items: ['Ar condicionado', 'Central multimídia'],
        about: '',
      ),
    ];
  }

  @override
  Future<VehicleModel> fetchVehicleDetails(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return VehicleModel(
      id: '1',
      model: 'Honda Civic 2024',
      km: 0,
      color: 'Prata',
      oldValue: 120000.00,
      newValue: 115000.00,
      city: 'Fortaleza',
      state: 'CE',
      storeType: StoreTypeEnum.dealership,
      status: VehicleStatusEnum.approved,
      brand: BrandModel(name: 'Honda', image: AppIcons.honda),
      year: 2024,
      gearbox: 'Automático',
      doors: 4,
      fuel: 'Gasolina',
      armored: false,
      items: ['Airbags', 'Rodas de liga leve', 'Ar condicionado'],
      condition: VehicleConditionEnum.newVehicle,
      about:
          'Único dono, revisões feitas na autorizada, pacote premium (som beats), 100% original, ja instalado o engate, manual e chave reserva, para quem procura um carro econômico e de qualidade absoluta.\nEsta a procura de comprar um carro novo ou seminovo, ou até mesmo alugar? aqui tem. Gostou desse carro? Temos uma equipe de consultores, concessionaria e locadora disponíveis para tirar todas as suas dúvidas de forma rápida, segura e descomplicada.',
    );
  }

  @override
  Future<List<FeedbackModel>> fetchFeedbacks() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      FeedbackModel(
        clientName: 'Carlos Souza',
        clientPhoto: 'https://randomuser.me/api/portraits/men/1.jpg',
        comment: 'Ótimo atendimento e veículo impecável!',
        rating: 4.8,
      ),
      FeedbackModel(
        clientName: 'Ana Oliveira',
        clientPhoto: 'https://randomuser.me/api/portraits/women/2.jpg',
        comment: 'Muito satisfeita com a compra, recomendo!',
        rating: 5.0,
      ),
      FeedbackModel(
        clientName: 'Pedro Lima',
        clientPhoto: 'https://randomuser.me/api/portraits/men/3.jpg',
        comment: 'Atendimento bom, mas o carro tinha pequenos detalhes.',
        rating: 3.9,
      ),
      FeedbackModel(
        clientName: 'Mariana Ferreira',
        clientPhoto: 'https://randomuser.me/api/portraits/women/4.jpg',
        comment: 'Ótima experiência, voltarei a comprar aqui!',
        rating: 4.5,
      ),
      FeedbackModel(
        clientName: 'Lucas Martins',
        clientPhoto: 'https://randomuser.me/api/portraits/men/5.jpg',
        comment: 'Carro entregue no prazo e em perfeitas condições!',
        rating: 4.7,
      ),
    ];
  }
}
