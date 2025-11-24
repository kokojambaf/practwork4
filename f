<Window x:Class="CinemaTicketApp.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Cinema Ticket Generator" Height="300" Width="400">
    <Grid>
        <TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,10,0,0" FontSize="14">Номер билета</TextBlock>
        <TextBox x:Name="TicketNumber" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,40,0,0" Width="360"/>

        <TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,80,0,0" FontSize="14">Название фильма</TextBlock>
        <TextBox x:Name="MovieName" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,110,0,0" Width="360"/>

        <TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,150,0,0" FontSize="14">Дата и время сеанса</TextBlock>
        <TextBox x:Name="ShowTime" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,180,0,0" Width="360"/>

        <TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,220,0,0" FontSize="14">Кинотеатр</TextBlock>
        <TextBox x:Name="CinemaName" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,250,0,0" Width="360"/>

        <TextBlock HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,290,0,0" FontSize="14">Зал, Ряд, Место</TextBlock>
        <TextBox x:Name="SeatInfo" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,320,0,0" Width="360"/>

        <Button Content="Сгенерировать билет" HorizontalAlignment="Center" VerticalAlignment="Bottom" Margin="0,0,0,10" Width="180" Height="40" Click="GenerateTicket"/>
    </Grid>
</Window>



using System;
using System.IO;
using System.Windows;

namespace CinemaTicketApp
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void GenerateTicket(object sender, RoutedEventArgs e)
        {
            // Получаем данные из текстовых полей
            string ticketNumber = TicketNumber.Text;
            string movieName = MovieName.Text;
            string showTime = ShowTime.Text;
            string cinemaName = CinemaName.Text;
            string seatInfo = SeatInfo.Text;

            // Формируем строку билета
            string ticketContent = $"Билет № {ticketNumber}\n" +
                                   $"Название фильма: {movieName}\n" +
                                   $"Начало сеанса: {showTime}\n" +
                                   $"Кинотеатр: {cinemaName}\n" +
                                   $"Зал: {seatInfo.Split(',')[0]}\n" +
                                   $"Ряд: {seatInfo.Split(',')[1]}\n" +
                                   $"Место: {seatInfo.Split(',')[2]}\n";

            // Сохраняем в .txt файл
            string fileName = $"Ticket_{ticketNumber}.txt";
            File.WriteAllText(fileName, ticketContent);

            MessageBox.Show("Билет успешно сгенерирован!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }
}
