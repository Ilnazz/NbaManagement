using System.Windows.Input;

namespace NbaManagement.Mvvm.Input
{
    public interface IRelayCommand : ICommand
    {
        void NotifyCanExecuteChanged();
    }
}