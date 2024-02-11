using NbaManagement.Mvvm.ComponentModel;
using NbaManagement.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Media.Imaging;

namespace NbaManagement.ViewModels
{
    public class PhotoSliderViewModel : ObservableObject
    {
        public IEnumerable<BitmapImage> Photos => _photos.GetRange(_startIndex, _count);

        #region Commands
        public IRelayCommand SlideBackCommand { get; }

        public IRelayCommand SlideForwardCommand { get; }
        #endregion

        #region Fields
        private readonly List<BitmapImage> _photos;

        private int _startIndex = 0;

        private const int _count = 3;
        #endregion

        public PhotoSliderViewModel()
        {
            _photos = Enumerable.Range(1, 18).Select(number => new BitmapImage(
                new Uri($"pack://application:,,,/NbaManagement;component/Resources/Images/MatchupPhotos/{number}.jpg"))).ToList();

            SlideBackCommand = new RelayCommand(() =>
            {
                _startIndex -= _count;
                if (_startIndex < 0)
                    _startIndex = 0;

                OnPropertyChanged(nameof(Photos));

                SlideBackCommand.NotifyCanExecuteChanged();
                SlideForwardCommand.NotifyCanExecuteChanged();
            },
            () => _startIndex > 0);

            SlideForwardCommand = new RelayCommand(() =>
            {
                _startIndex += _count;

                OnPropertyChanged(nameof(Photos));

                SlideBackCommand.NotifyCanExecuteChanged();
                SlideForwardCommand.NotifyCanExecuteChanged();
            },
            () => _startIndex + _count < _photos.Count - 1);
        }
    }
}