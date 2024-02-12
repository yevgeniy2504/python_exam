class Animal:
    def __init__(self, name, animal_type):
        self.name = name
        self.animal_type = animal_type
        self.commands = []

    def add_command(self, command):
        self.commands.append(command)

    def show_commands(self):
        print(f"Список команд для {self.name}:")
        for command in self.commands:
            print(command)


class DomesticAnimal(Animal):
    def __init__(self, name):
        super().__init__(name, "Домашнее животное")


class LivestockAnimal(Animal):
    def __init__(self, name):
        super().__init__(name, "Вьючное животное")


class AnimalRegistry:
    def __init__(self):
        self.animals = []

    def add_animal(self, animal):
        if isinstance(animal, Animal):
            self.animals.append(animal)
            print(f"Животное {animal.name} успешно добавлено в реестр")

    def list_animals(self):
        print("Список зарегистрированных животных:")
        for animal in self.animals:
            print(animal.name)


if __name__ == "__main__":
    registry = AnimalRegistry()

    while True:
        print("\nМеню:")
        print("1. Завести новое животное")
        print("2. Просмотреть список зарегистрированных животных")
        print("3. Выход")

        choice = input("Выберите действие: ")

        if choice == "1":
            animal_name = input("Введите имя животного: ")
            animal_type = input("Введите тип животного (домашнее/вьючное): ").lower()

            if animal_type == "домашнее":
                animal = DomesticAnimal(animal_name)
            elif animal_type == "вьючное":
                animal = LivestockAnimal(animal_name)
            else:
                print("Некорректный тип животного")
                continue

            registry.add_animal(animal)

        elif choice == "2":
            registry.list_animals()

        elif choice == "3":
            print("Выход из программы")
            break

        else:
            print("Некорректный ввод. Попробуйте снова.")
