using NbaManagement.Database;
using System;
using System.Globalization;
using System.Windows.Data;
using System.Windows.Media.Imaging;

namespace NbaManagement.Converters
{
    public class TeamToImageConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is Team team == false)
                return null;

            return new BitmapImage(new Uri($"pack://application:,,,/NbaManagement;component/Resources/Images/TeamLogos/{team.Id}.jpg"));
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture) =>
            throw new NotImplementedException();
    }
}