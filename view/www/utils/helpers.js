export function clone(val) {
    return JSON.parse(JSON.stringify(val))
  }
  
  export function Notification(self, message, type) {
    self.$snackbar.open({
      duration: 1000,
      message: message,
      type: type,
      position: 'is-top'
    })
  }
  
  export function Dialog(self, message, type, onConfirm) {
    self.$dialog.alert({
      message: message,
      type: type,
      position: "is-top",
      onConfirm: onConfirm
    });
  }
  
  export function copy(val) {
    if (typeof val === 'object') {
      return JSON.parse(JSON.stringify(val));
    }
    return null;
  }