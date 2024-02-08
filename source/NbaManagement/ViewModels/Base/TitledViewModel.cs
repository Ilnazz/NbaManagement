using NbaManagement.Mvvm;
using NbaManagement.Mvvm.ComponentModel;

namespace NbaManagement.ViewModels.Base
{
    public abstract class TitledViewModel : ObservableObject
    {
        private string _title;
        public string Title
        {
            get => _title;
            protected set => SetProperty(ref _title, value);
        }
    }
}